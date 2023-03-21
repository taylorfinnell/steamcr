require "compress/gzip"
require "digest/sha1"

module Steamcr
  module PacketHandler
    abstract def handle_packet(packet_message : Protocol::PacketMessage)
  end

  module Event
  end

  class OnReadyEvent
    include Event
  end

  # Represents a Client on the Steam Network. The Client creates a connection
  # to the Steam networks, and send and receives Message objects to that
  # connection.
  #
  # The Client holds a collection of handlers that react to received packets,
  # if they care about the packet data.
  class Client
    property session_id
    property steam_id
    getter auth
    getter events
    getter gc

    @key : Bytes?
    @steam_id : UInt64 = 76561197960265728u64
    @session_id : Int32?
    @connect_tokens : Array(Bytes) = Array(Bytes).new
    @handlers = Array(PacketHandler).new

    def initialize(@debug : Bool = ENV.has_key?("STEAMCR_DEBUG"))
      @connection = Networking::TcpConnection.new
      @mutex = Mutex.new
      @writes = Channel(Protocol::ClientMsg).new(1_000)
      @events = Channel(Event).new(1_000)
      @key = nil
      @auth = Auth.new(self)
      @gc = GameCord.new(self)
      @handlers.push(@auth.not_nil!)
      @handlers.push(@gc.not_nil!)
    end

    def register_handler(handler : PacketHandler)
      @handlers.push(handler)
    end

    def emit(event : Event)
      @events.send(event)
    end

    def connect
      disconnect
      connection.connect(ServerList.new.to_a.sample)

      spawn name: "read" do
        read_loop
      end

      spawn name: "write" do
        write_loop
      end
    end

    def disconnect
    end

    def write(msg : Protocol::ClientMsg)
      @writes.send(msg)
    end

    private def read_loop
      loop do
        data = connection.read

        unless data.nil?
          packet_msg = get_packet_message(data)
          unless packet_msg.nil?
            handle_packet_message(packet_msg)
          end
        end

        Fiber.yield
      end
    end

    private def write_loop
      loop do
        msg = @writes.receive

        if id = @steam_id
          msg.set_steam_id(id)
        end

        if id = @session_id
          msg.set_session_id(id)
        end

        connection.write(msg.serialize)

        Fiber.yield
      end
    end

    private def get_packet_message(data : Bytes) : Protocol::PacketMessage?
      raw_emsg = IO::Memory.new(data).read_bytes(UInt32)
      emsg = MsgUtil.emsg(raw_emsg)

      io = IO::Memory.new(data)

      if emsg == EMsg::CHANNEL_ENCRYPT_REQUEST || emsg == EMsg::CHANNEL_ENCRYPT_RESULT
        Protocol::PacketMsg.new(emsg, io)
      elsif MsgUtil.proto?(raw_emsg)
        Protocol::PacketClientMsgProtobuf.new(emsg, io)
      else
        if @debug
          STDERR.puts "Extended message packets not implemented"
        end
        nil
      end
    end

    def handle_packet_message(message : Protocol::PacketMessage)
      return handle_multi(message) if message.emsg.multi?

      case message.emsg
      when EMsg::CHANNEL_ENCRYPT_REQUEST
        request = Protocol::Msg(MsgChannelEncryptRequest).new(message)

        crypto = Crypto.new
        crypted_key, @key = crypto.generate_key

        msg = Protocol::Msg(MsgChannelEncryptResponse).new(EMsg::CHANNEL_ENCRYPT_RESPONSE)
        msg.payload.write(crypted_key)
        msg.payload.write_bytes(crypto.session_key_crc(crypted_key))
        msg.payload.write_byte(0)
        msg.payload.write_byte(0)
        msg.payload.write_byte(0)
        msg.payload.write_byte(0)

        write(msg)
      when EMsg::CHANNEL_ENCRYPT_RESULT
        msg = Protocol::Msg(MsgChannelEncryptResult).new(message)

        if msg.body.result != EResult::OK
          raise Exception.new("Invalid CHANNEL_ENCRYPT_RESULT")
        end

        connection.set_key(@key.not_nil!)
        @key = nil
        emit(OnReadyEvent.new)
      when EMsg::CLIENT_GAME_CONNECT_TOKENS
        msg = Protocol::MsgProtobuf(Steam::CMsgClientGameConnectTokens).new(message)
        update_connect_tokens(msg.body.tokens, msg.body.max_tokens_to_keep)
      end

      @handlers.each do |handler|
        handler.handle_packet(message)
      end
    end

    def handle_multi(message : Protocol::PacketMessage)
      if !message.proto?
        raise Exception.new("Multi got none protobuf")
      end

      msg = Protocol::MsgProtobuf(Steam::CMsgMulti).new(message)

      io = if msg.body.size_unzipped && msg.body.size_unzipped.not_nil! > 0
             Compress::Gzip::Reader.new(IO::Memory.new(msg.body.message_body.not_nil!))
           else
             IO::Memory.new(msg.body.message_body.not_nil!)
           end

      read = 0

      full_len = msg.body.size_unzipped && msg.body.size_unzipped.not_nil! ? msg.body.size_unzipped.not_nil! : msg.body.message_body.not_nil!.size
      loop do
        len = io.read_bytes(Int32)
        read += 4
        bytes = Bytes.new(len)
        read += io.read_fully(bytes)
        msg = get_packet_message(bytes)
        handle_packet_message(msg) if msg
        break if read >= full_len
      end
    end

    def heartbeat(sleep_time)
      loop do
        msg = Protocol::MsgProtobuf(Steam::CMsgClientHeartBeat).new(EMsg::CLIENT_HEART_BEAT)
        write(msg)
        if @debug
          STDERR.puts "Heartbeat... sleeping #{sleep_time}s"
        end
        sleep sleep_time
      end
    end

    private def connection
      @mutex.synchronize do
        @connection
      end
    end

    private def update_connect_tokens(tokens, max)
      if tokens
        tokens.not_nil!.each { |t| @connect_tokens.insert(0, t) }
        if max
          @connect_tokens = @connect_tokens.first(max.not_nil!)
        end
      end
    end
  end
end

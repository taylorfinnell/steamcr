module Steamcr
  module GCHandler
    abstract def handle_gc_packet(packet : Protocol::GCPacketMessage)
  end

  class GameCord
    include PacketHandler

    def initialize(@client : Client)
      @handlers = Array(GCHandler).new
    end

    def register_handler(handler)
      @handlers.push(handler)
    end

    def handle_packet(message : Protocol::PacketMessage)
      case message.emsg
      when EMsg::CLIENT_FROM_GC
        msg = Protocol::MsgProtobuf(Steam::CMsgGCClient).new(message)
        handle_gc_message(msg.body)
      end
    end

    def play(game_id : UInt32)
      played = Steam::CMsgClientGamesPlayed::GamePlayed.new
      played.game_id = game_id.to_u64

      msg = Protocol::MsgProtobuf(Steam::CMsgClientGamesPlayed).new(EMsg::CLIENT_GAMES_PLAYED_WITH_DATA_BLOB)
      msg.body.games_played = [played]

      @client.write(msg)

      sleep 5

      msg = Protocol::MsgGameCoordinatorProtobuf(Csgo::CMsgClientHello).new(Csgo::EGCBaseClientMsg::KEMsgGCClientHello.value.to_u32)
      msg.body.version = 1
      write(game_id.to_u32, msg)
    end

    def write(app_id : UInt32, msg : Protocol::MsgGameCoordinatorProtobuf)
      gc = Protocol::MsgProtobuf(Steam::CMsgGCClient).new(EMsg::CLIENT_TO_GC)
      gc.body.appid = app_id
      gc.body.msgtype = MsgUtil.make_gc(msg.header.msg, msg.proto?)
      gc.body.payload = msg.serialize
      gc.header.proto.routing_appid = app_id

      @client.write(gc)
    end

    private def handle_gc_message(msg : Steam::CMsgGCClient)
      real_emsg = MsgUtil.get_gc(msg.msgtype.not_nil!)

      if MsgUtil.proto?(msg.msgtype.not_nil!)
        gc_packet = Protocol::PacketClientGCMsgProtobuf.new(real_emsg, msg.payload.not_nil!)
      else
        raise Exception.new("Not proto gc messages are not impl")
      end

      @handlers.each { |h| h.handle_gc_packet(gc_packet) }
    end
  end
end

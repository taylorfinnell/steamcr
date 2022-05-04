# frozen_string_literal: true
require "socket"

module Steamcr
  module Networking
    class TcpConnection < Connection
      # Valve's TCP Packet identifier
      TCP_MAGIC = "VT01"

      @socket : TCPSocket?
      @key : Bytes?

      def connect(server)
        @socket = TCPSocket.new(server.host, server.port)
      end

      def read : Bytes?
        packet_size = read_header
        packet_data = Bytes.new(packet_size)

        if !packet_size.zero?
          @socket.not_nil!.read_fully(packet_data)

          if key = @key
            crypto = Crypto.new
            packet_data = crypto.decrypt(packet_data, key)
          end

          packet_data
        else
          nil
        end
      end

      def write(data : Bytes)
        io = IO::Memory.new

        if key = @key
          crypto = Crypto.new
          data = crypto.encrypt(data, key)
        end

        io.write_bytes(data.bytesize)
        io.write(TCP_MAGIC.to_slice)
        io.write(data)

        @socket.not_nil!.send(io)
      end

      def set_key(key : Bytes)
        @key = key
      end

      private def read_header
        bytes = Bytes.new(8)
        @socket.not_nil!.read(bytes)
        io = IO::Memory.new(bytes)
        size = io.read_bytes(Int32)
        magic = io.read_string(4)

        raise "invalid packet: size=#{size}, magic=#{magic}" unless size != 0 && magic == TCP_MAGIC
        size
      end
    end
  end
end

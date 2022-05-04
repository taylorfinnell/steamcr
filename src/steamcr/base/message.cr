module Steamcr
  module Protocol
    abstract class PacketMessage
      abstract def emsg : EMsg
      abstract def proto? : Bool
      abstract def target_job_id : UInt64
      abstract def source_job_id : UInt64
      abstract def data : Bytes
    end

    class PacketMsg < PacketMessage
      @bytes : Bytes

      def initialize(@emsg : EMsg, io : IO)
        @bytes = io.to_slice
        @header = MsgHdr.new
        @header.deserialize(io.dup)
      end

      def target_job_id : UInt64
        @header.target_job_id
      end

      def source_job_id : UInt64
        @header.source_job_id
      end

      def proto? : Bool
        false
      end

      def emsg : EMsg
        @emsg
      end

      def data : Bytes
        @bytes
      end
    end

    class PacketClientMsgProtobuf < PacketMessage
      @bytes : Bytes

      def initialize(@emsg : EMsg, io : IO)
        @bytes = io.to_slice
        @header = MsgHdrProtoBuf.new
        @header.deserialize(io.dup)
      end

      def target_job_id : UInt64
        @header.proto.target_job_id
      end

      def source_job_id : UInt64
        @header.proto.source_job_id
      end

      def proto? : Bool
        true
      end

      def emsg : EMsg
        @emsg
      end

      def data : Bytes
        @bytes
      end
    end

    abstract class ClientMsg
      abstract def proto? : Bool
      abstract def serialize : Bytes
      abstract def deserialize(data : Bytes)
      abstract def set_steam_id(id : UInt64)
      abstract def set_session_id(id : In32)
    end

    abstract class MsgBase(H) < ClientMsg
      @header : H

      getter payload

      def initialize
        @header = H.new
        @payload = IO::Memory.new
      end

      def header : H
        @header
      end
    end

    class Msg(T) < MsgBase(Steamcr::MsgHdr)
      getter body

      def initialize(packet : PacketMessage)
        super()
        @body = T.new
        deserialize(packet.data)
      end

      def initialize(emsg : EMsg)
        super()
        @header.msg = emsg
        @body = T.new
      end

      def set_steam_id(id : UInt64)
      end

      def set_session_id(id : Int32)
      end

      def serialize : Bytes
        io = IO::Memory.new
        @header.serialize(io)
        @body.serialize(io)
        io.write(@payload.to_slice)
        io.to_slice
      end

      def deserialize(data : Bytes) : T
        io = IO::Memory.new(data)
        header.deserialize(io)
        @body.deserialize(io)
        @body
      end

      def proto? : Bool
        false
      end
    end

    class MsgProtobuf(T) < MsgBase(Steamcr::MsgHdrProtoBuf)
      getter body

      def initialize(packet : PacketMessage)
        super()
        @body = deserialize(packet.data)
      end

      def initialize(emsg : EMsg)
        super()
        @header.msg = emsg
        @body = T.new
      end

      def serialize : Bytes
        io = IO::Memory.new
        @header.serialize(io)
        @body.to_protobuf(io)
        io.to_slice
      end

      def deserialize(data : Bytes) : T
        io = IO::Memory.new(data)
        header.deserialize(io)
        T.from_protobuf(io)
      end

      def proto? : Bool
        true
      end

      def set_steam_id(id : UInt64)
        @header.proto.steamid = id
      end

      def set_session_id(id : Int32)
        @header.proto.client_sessionid = id
      end
    end
  end
end

module Steamcr
  module Protocol
    abstract class GCPacketMessage
      abstract def proto? : Bool
      abstract def msg_type : UInt32
      abstract def data : Bytes
    end

    class PacketClientGCMsgProtobuf < GCPacketMessage
      def initialize(@msg : UInt32, @data : Bytes)
      end

      def proto? : Bool
        true
      end

      def msg_type : UInt32
        @msg
      end

      def data : Bytes
        @data
      end
    end

    class MsgGameCoordinatorProtobuf(T)
      getter body
      getter header

      @header : Steamcr::MsgGCHdrProtoBuf = Steamcr::MsgGCHdrProtoBuf.new

      def initialize(packet : GCPacketMessage)
        super()
        @body = deserialize(packet.data)
      end

      def initialize(emsg : UInt32)
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
    end
  end
end

module Steamcr
  class MsgGCHdrProtoBuf
    @msg : UInt32
    @header_length : Int32?
    @proto : GC::CMsgProtoBufHeader

    property msg
    property header_length
    property proto

    def initialize(@header_length : Int32? = nil, @proto : GC::CMsgProtoBufHeader = GC::CMsgProtoBufHeader.new)
      @msg = 0
    end

    def deserialize(io : IO::Memory)
      @msg = io.read_bytes(UInt32) & ~0x80000000
      @header_length = io.read_bytes(Int32)
      tmp = Bytes.new(@header_length.not_nil!)

      io.read_fully(tmp)
      @proto = typeof(@proto).from_protobuf(IO::Memory.new(tmp))
    end

    def serialize(io : IO::Memory)
      io.write_bytes(@msg | 0x80000000)
      tmp = IO::Memory.new
      @proto.not_nil!.to_protobuf(tmp)
      tmpb = tmp.to_slice
      @header_length = tmpb.size
      io.write_bytes(@header_length.not_nil!)
      io.write(tmpb)
    end
  end
end

module Steamcr
  class MsgGCHdr
    @header_version : UInt16
    @target_job_id : UInt64
    @source_job_id : UInt64

    property header_version
    property target_job_id
    property source_job_id

    def initialize
      @header_version = 1
      @target_job_id = 0xFFFFFFFFFFFFFFFF
      @source_job_id = 0xFFFFFFFFFFFFFFFF
    end

    def deserialize(io : IO::Memory)
      @header_version = io.read_bytes(UInt16)
      @target_job_id = io.read_bytes(UInt64)
      @source_job_id = io.read_bytes(UInt64)
    end

    def serialize(io : IO::Memory)
      io.write_bytes(@header_version)
      io.write_bytes(@target_job_id)
      io.write_bytes(@source_job_id)
    end
  end
end

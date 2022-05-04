require "./emsg"
require "./eresult"
require "./enums"
require "./netheader"

module Steamcr
  class MsgHdr
    @msg : EMsg
    @target_job_id : UInt64
    @source_job_id : UInt64

    property msg
    property target_job_id
    property source_job_id

    def initialize
      @msg = EMsg::INVALID
      @target_job_id = 0xFFFFFFFFFFFFFFFF
      @source_job_id = 0xFFFFFFFFFFFFFFFF
    end

    def deserialize(io : IO::Memory)
      @msg = io.read_bytes(EMsg)
      @target_job_id = io.read_bytes(UInt64)
      @source_job_id = io.read_bytes(UInt64)
    end

    def serialize(io : IO::Memory)
      io.write_bytes(@msg)
      io.write_bytes(@target_job_id)
      io.write_bytes(@source_job_id)
    end
  end
end

module Steamcr
  class ExtendedClientMsgHdr
    @msg : EMsg
    @header_size : UInt8
    @header_version : UInt16
    @target_job_id : UInt64
    @source_job_id : UInt64
    @header_canary : UInt8
    @steam_id : UInt64
    @session_id : Int32

    property msg
    property header_size
    property header_version
    property target_job_id
    property source_job_id
    property header_canary
    property steam_id
    property session_id

    def initialize(@steam_id : UInt64, @session_id : Int32)
      @msg = EMsg::INVALID
      @header_size = 36
      @header_version = 2
      @target_job_id = 0xFFFFFFFFFFFFFFFF
      @source_job_id = 0xFFFFFFFFFFFFFFFF
      @header_canary = 239
    end

    def deserialize(io : IO::Memory)
      @msg = io.read_bytes(EMsg)
      @header_size = io.read_bytes(UInt8)
      @header_version = io.read_bytes(UInt16)
      @target_job_id = io.read_bytes(UInt64)
      @source_job_id = io.read_bytes(UInt64)
      @header_canary = io.read_bytes(UInt8)
      @steam_id = io.read_bytes(UInt64)
      @session_id = io.read_bytes(Int32)
    end

    def serialize(io : IO::Memory)
      io.write_bytes(@msg)
      io.write_bytes(@header_size)
      io.write_bytes(@header_version)
      io.write_bytes(@target_job_id)
      io.write_bytes(@source_job_id)
      io.write_bytes(@header_canary)
      io.write_bytes(@steam_id)
      io.write_bytes(@session_id)
    end
  end
end

module Steamcr
  class MsgHdrProtoBuf
    @msg : EMsg
    @header_length : Int32?
    @proto : Steam::CMsgProtoBufHeader

    property msg
    property header_length
    property proto

    def initialize(@header_length : Int32? = nil, @proto : Steam::CMsgProtoBufHeader = Steam::CMsgProtoBufHeader.new)
      @msg = EMsg::INVALID
    end

    def deserialize(io : IO::Memory)
      @msg = EMsg.new(io.read_bytes(Int32) & ~0x80000000)
      @header_length = io.read_bytes(Int32)
      tmp = Bytes.new(@header_length.not_nil!)

      io.read_fully(tmp)
      @proto = typeof(@proto).from_protobuf(IO::Memory.new(tmp))
    end

    def serialize(io : IO::Memory)
      io.write_bytes(EMsg.new(@msg.value | 0x80000000))
      tmp = IO::Memory.new
      @proto.not_nil!.to_protobuf(tmp)
      tmpb = tmp.to_slice
      @header_length = tmpb.size
      io.write_bytes(@header_length.not_nil!)
      io.write(tmpb)
    end
  end
end

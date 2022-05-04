module Steamcr
  enum EUdpPacketType : UInt8
    def self.from_io(io, format)
      EUdpPacketType.new(io.read_bytes(UInt8))
    end

    def to_io(io, format)
      format.encode(self.value, io)
    end

    INVALID       = 0
    CHALLENGE_REQ = 1
    CHALLENGE     = 2
    CONNECT       = 3
    ACCEPT        = 4
    DISCONNECT    = 5
    DATA          = 6
    DATAGRAM      = 7
    MAX           = 8
  end
end

module Steamcr
  class UdpHeader
    MAGIC = 825250646u32
    @magic : UInt32
    @payload_size : UInt16
    @packet_type : EUdpPacketType
    @flags : UInt8
    @source_conn_id : UInt32
    @dest_conn_id : UInt32
    @seq_this : UInt32
    @seq_ack : UInt32
    @packets_in_msg : UInt32
    @msg_start_seq : UInt32
    @msg_size : UInt32

    property magic
    property payload_size
    property packet_type
    property flags
    property source_conn_id
    property dest_conn_id
    property seq_this
    property seq_ack
    property packets_in_msg
    property msg_start_seq
    property msg_size

    def initialize(@payload_size : UInt16, @flags : UInt8, @dest_conn_id : UInt32, @seq_this : UInt32, @seq_ack : UInt32, @packets_in_msg : UInt32, @msg_start_seq : UInt32, @msg_size : UInt32)
      @magic = UdpHeader::MAGIC
      @packet_type = EUdpPacketType::INVALID
      @source_conn_id = 512
    end

    def deserialize(io : IO::Memory)
      @magic = io.read_bytes(UInt32)
      @payload_size = io.read_bytes(UInt16)
      @packet_type = io.read_bytes(EUdpPacketType)
      @flags = io.read_bytes(UInt8)
      @source_conn_id = io.read_bytes(UInt32)
      @dest_conn_id = io.read_bytes(UInt32)
      @seq_this = io.read_bytes(UInt32)
      @seq_ack = io.read_bytes(UInt32)
      @packets_in_msg = io.read_bytes(UInt32)
      @msg_start_seq = io.read_bytes(UInt32)
      @msg_size = io.read_bytes(UInt32)
    end

    def serialize(io : IO::Memory)
      io.write_bytes(@magic)
      io.write_bytes(@payload_size)
      io.write_bytes(@packet_type)
      io.write_bytes(@flags)
      io.write_bytes(@source_conn_id)
      io.write_bytes(@dest_conn_id)
      io.write_bytes(@seq_this)
      io.write_bytes(@seq_ack)
      io.write_bytes(@packets_in_msg)
      io.write_bytes(@msg_start_seq)
      io.write_bytes(@msg_size)
    end
  end
end

module Steamcr
  class ChallengeData
    CHALLENGE_MASK = 2754010923u32
    @challenge_value : UInt32
    @server_load : UInt32

    property challenge_value
    property server_load

    def initialize(@challenge_value : UInt32, @server_load : UInt32)
    end

    def deserialize(io : IO::Memory)
      @challenge_value = io.read_bytes(UInt32)
      @server_load = io.read_bytes(UInt32)
    end

    def serialize(io : IO::Memory)
      io.write_bytes(@challenge_value)
      io.write_bytes(@server_load)
    end
  end
end

module Steamcr
  class ConnectData
    CHALLENGE_MASK = ChallengeData::CHALLENGE_MASKu32
    @challenge_value : UInt32

    property challenge_value

    def initialize(@challenge_value : UInt32)
    end

    def deserialize(io : IO::Memory)
      @challenge_value = io.read_bytes(UInt32)
    end

    def serialize(io : IO::Memory)
      io.write_bytes(@challenge_value)
    end
  end
end

module Steamcr
  class Accept
    def initialize
    end

    def deserialize(io : IO::Memory)
    end

    def serialize(io : IO::Memory)
    end
  end
end

module Steamcr
  class Datagram
    def initialize
    end

    def deserialize(io : IO::Memory)
    end

    def serialize(io : IO::Memory)
    end
  end
end

module Steamcr
  class Disconnect
    def initialize
    end

    def deserialize(io : IO::Memory)
    end

    def serialize(io : IO::Memory)
    end
  end
end

module Steamcr
  class MsgUtil
    PROTO_MASK = 0x80000000
    EMSG_MASK  = ~PROTO_MASK

    def self.emsg(e : UInt32)
      EMsg.from_value(e & EMSG_MASK)
    end

    def self.proto?(e : UInt32)
      (e & PROTO_MASK) > 0
    end

    def self.make_gc(e : UInt32, proto : Bool)
      if proto
        e | PROTO_MASK
      else
        e
      end
    end

    def self.get_gc(e : UInt32)
      e & EMSG_MASK
    end
  end
end

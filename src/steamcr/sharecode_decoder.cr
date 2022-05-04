module Steamcr
  class Sharecode
    getter matchid
    getter outcomeid
    getter token
    getter plain

    def initialize(@matchid : UInt64, @outcomeid : UInt64, @token : UInt16, @plain : String)
    end
  end

  class SharecodeDecoder
    InvalidShareCode = Class.new(StandardError)
    DecodingError    = Class.new(StandardError)

    DICTIONARY        = "ABCDEFGHJKLMNOPQRSTUVWXYZabcdefhijkmnopqrstuvwxyz23456789"
    DICTIONARY_LENGTH = DICTIONARY.length

    getter :code
    @code : String

    def initialize(code : String)
      @plain = code
      @code = code.gsub(/CSGO|\-/, "")
    end

    def decode
      io = IO::Memory.new(decoded)

      matchid = io.read_bytes(UInt64)
      outcomeid = io.read_bytes(UInt64)
      tokenid = io.read_bytes(UInt16)

      Sharecode.new(matchid, outcomeid, tokenid, @plain)
    end

    # https://gist.github.com/taylorfinnell/ad74a26ad5a94fa303de
    def decoded
      result = Bytes.new(18, 0)

      @code.chars.reverse.each_with_index do |char, index|
        addval = DICTIONARY.index(char).not_nil!

        tmp = Bytes.new(18, 0)

        carry, v = 0, 0
        17.downto(0).each do |t|
          carry = 0
          t.downto(0).each do |s|
            if t - s == 0
              v = tmp[s].to_i32 + result[t].to_i32 * 57
            else
              v = 0
            end

            v = v + carry
            carry = v >> 8
            tmp[s] = (v & 0xFF).to_u8
          end
        end

        result = tmp

        carry = 0
        17.downto(0).each do |t|
          if t == 17
            v = result[t].to_i32 + addval
          else
            v = result[t].to_i32
          end

          v = v + carry
          carry = v >> 8
          result[t] = (v & 0xFF).to_u8
        end
      end

      result
    end
  end
end

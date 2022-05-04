module Steamcr::SteamLanguage::Lexer::Matcher
  class NumberMatcher
    include Matcher

    def match?(stream) : Token?
      num = integers(stream)

      if num
        case stream.current
        when "."
          stream.consume

          num2 = integers(stream)
          if num2
            Token.new(TokenType::FLOAT, "#{num}.#{num2}")
          else
            raise "expecting float"
          end
        when "x", "X"
          stream.consume

          num2 = characters(stream)
          if num2
            Token.new(TokenType::HEX, "#{num2}".to_i64(16).to_s)
          else
            raise "expecting hex"
          end
        else
          Token.new(TokenType::INT, num)
        end
      else
        if constants(stream)
          Token.new(TokenType::HEX, "0xFFFFFFFFFFFFFFFF")
        end
      end
    end

    private def constants(stream)
      chars = ""

      while stream.current != nil && stream.current.to_s =~ /[A-Za-z\.]/
        chars += stream.current.to_s
        stream.consume
      end

      if chars.empty?
        return nil
      end

      if chars =~ /ulong\.MaxValue/
        return chars
      end
      nil
    end

    private def characters(stream)
      chars = ""

      while stream.current != nil && stream.current.to_s =~ /[A-Za-z0-9]/
        chars += stream.current.to_s
        stream.consume
      end

      if chars.empty?
        return nil
      else
        chars
      end
    end

    private def integers(stream)
      num = ""

      while stream.current != nil && stream.current.to_s =~ /[0-9\-]/
        num += stream.current.to_s
        stream.consume
      end

      if num.empty?
        return nil
      else
        num
      end
    end
  end
end

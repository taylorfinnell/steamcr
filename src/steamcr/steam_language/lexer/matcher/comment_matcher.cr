module Steamcr::SteamLanguage::Lexer::Matcher
  class CommentMatcher
    include Matcher

    def initialize
      @type = TokenType::COMMENT
    end

    def match?(stream) : Token?
      if stream.current == "/"
        stream.consume
      else
        return nil
      end

      if stream.current == "/"
        stream.consume
      else
        return nil
      end

      until Util.empty_or_nil?(stream.current) || Util.escaped_char?(stream.current)
        stream.consume
      end

      Token.new(TokenType::COMMENT)
    end
  end
end

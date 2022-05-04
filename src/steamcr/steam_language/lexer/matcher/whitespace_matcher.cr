module Steamcr::SteamLanguage::Lexer::Matcher
  class WhitespaceMatcher
    include Matcher

    def match?(stream) : Token?
      found = false

      while !stream.eof? && Util.empty_or_nil?(stream.current)
        found = true
        stream.consume
      end

      if found
        Token.new(TokenType::WHITESPACE)
      end
    end
  end
end

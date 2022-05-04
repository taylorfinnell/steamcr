module Steamcr::SteamLanguage::Lexer::Matcher
  class StringMatcher
    include Matcher

    def initialize
      @type = TokenType::STRING
    end

    def match?(stream) : Token?
      if stream.current == "\""
        stream.consume

        string = String.build do |str|
          while stream.current =~ /^(?!").*$/
            str << stream.current.to_s
            stream.consume
          end
        end

        if stream.current == "\""
          stream.consume

          return nil if string.empty?
          Token.new(@type, string)
        else
          nil
        end
      end
    end
  end
end

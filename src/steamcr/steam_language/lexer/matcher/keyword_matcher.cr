module Steamcr::SteamLanguage::Lexer::Matcher
  class KeywordMatcher
    include Matcher

    getter keyword

    @terminators = [] of String
    @check_terminators : Bool

    def initialize(@type : TokenType, @keyword : String, special_matchers = [] of KeywordMatcher)
      @check_terminators = special_matchers.empty?
      @terminators = special_matchers.map(&.keyword)
    end

    def match?(stream : Tokenizer::Stream) : Token?
      @keyword.each_char do |char|
        return nil if stream.current != char.to_s

        stream.consume
      end

      Token.new(@type, @keyword) if end_of_keyword?(stream)
    end

    def to_s(io : IO)
      io << "match: #{self.class.name}, #{@type}, #{@keyword}"
    end

    private def end_of_keyword?(stream)
      if !@check_terminators
        Util.escaped_char?(stream.current) ||
          Util.empty_or_nil?(stream.current) || @terminators.includes?(stream.current.to_s)
      else
        true
      end
    end
  end
end

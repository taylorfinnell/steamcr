module Steamcr::SteamLanguage::Lexer::Matcher
  class WordMatcher
    include Matcher

    @keywords : Array(String)

    def initialize(keywords : Array(KeywordMatcher))
      @type = TokenType::IDENTIFIER
      @keywords = keywords.map(&.keyword)
    end

    def match?(stream : Tokenizer::Stream) : Token?
      word = String.build do |str|
        while !stream.eof? && !Util.empty_or_nil?(stream.current) &&
              !@keywords.includes?(stream.current.to_s) && stream.current != "\""
          str << stream.current.to_s
          stream.consume
        end
      end

      return nil if word.empty?

      Token.new(@type, word)
    end
  end
end

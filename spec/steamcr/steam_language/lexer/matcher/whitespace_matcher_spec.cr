require "../../../../spec_helper"

module Steamcr::SteamLanguage::Lexer::Matcher
  describe KeywordMatcher do
    it "can handle eof" do
      matcher = WhitespaceMatcher.new
      ret = matcher.match?(
        Tokenizer::Stream.new(IO::Memory.new)
      )

      ret.should be_nil
    end

    it "matches whitespace" do
      matcher = WhitespaceMatcher.new
      ret = matcher.match?(
        Tokenizer::Stream.new(IO::Memory.new(" "))
      )

      ret.should eq(Token.new(TokenType::WHITESPACE))
    end

    it "does not match if no whitespace" do
      matcher = WhitespaceMatcher.new
      ret = matcher.match?(
        Tokenizer::Stream.new(IO::Memory.new("!"))
      )

      ret.should be_nil
    end
  end
end

require "../../../../spec_helper"

module Steamcr::SteamLanguage::Lexer::Matcher
  describe StringMatcher do
    it "matches strings" do
      matcher = StringMatcher.new
      ret = matcher.match?(
        Tokenizer::Stream.new(IO::Memory.new("\"test\""))
      )

      ret.should eq(Token.new(TokenType::STRING, "test"))
    end

    it "matches strings with special chars" do
      matcher = StringMatcher.new
      ret = matcher.match?(
        Tokenizer::Stream.new(IO::Memory.new("\"test! sup, you\""))
      )

      ret.should eq(Token.new(TokenType::STRING, "test! sup, you"))
    end

    it "does not match if not string" do
      matcher = StringMatcher.new
      ret = matcher.match?(
        Tokenizer::Stream.new(IO::Memory.new("hi"))
      )

      ret.should be_nil
    end
  end
end

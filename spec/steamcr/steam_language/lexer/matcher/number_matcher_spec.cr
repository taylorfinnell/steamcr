require "../../../../spec_helper"

module Steamcr::SteamLanguage::Lexer::Matcher
  describe NumberMatcher do
    it "can match ints" do
      matcher = NumberMatcher.new

      token = matcher.matches?(
        Tokenizer::Stream.new(IO::Memory.new("123"))
      )

      token.should eq(Token.new(TokenType::INT, "123"))
    end

    it "can match floats" do
      matcher = NumberMatcher.new

      token = matcher.matches?(
        Tokenizer::Stream.new(IO::Memory.new("123.69"))
      )

      token.should eq(Token.new(TokenType::FLOAT, "123.69"))
    end

    it "can match hex" do
      matcher = NumberMatcher.new

      token = matcher.matches?(
        Tokenizer::Stream.new(IO::Memory.new("0xFf"))
      )

      token.should eq(Token.new(TokenType::HEX, "255"))
    end
  end
end

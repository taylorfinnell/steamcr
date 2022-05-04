require "../../../../spec_helper"

module Steamcr::SteamLanguage::Lexer::Matcher
  describe WordMatcher do
    it "does not match keywords" do
      matcher = WordMatcher.new(
        [KeywordMatcher.new(TokenType::LBRACE, "}")]
      )

      token = matcher.matches?(
        Tokenizer::Stream.new(IO::Memory.new("}"))
      )

      token.should be_nil
    end

    it "does not match if start of quoted string" do
      matcher = WordMatcher.new(
        [KeywordMatcher.new(TokenType::LBRACE, "}")]
      )

      token = matcher.matches?(
        Tokenizer::Stream.new(IO::Memory.new("\"adad\""))
      )

      token.should be_nil
    end

    it "cant start with terminating char" do
      matcher = WordMatcher.new(
        [KeywordMatcher.new(TokenType::LBRACE, "}")]
      )

      token = matcher.matches?(
        Tokenizer::Stream.new(IO::Memory.new("}classic"))
      )

      token.should be_nil
    end
  end
end

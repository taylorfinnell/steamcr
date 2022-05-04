require "../../../../spec_helper"

module Steamcr::SteamLanguage::Lexer::Matcher
  describe KeywordMatcher do
    it "does not match if not a terminating char" do
      matcher = KeywordMatcher.new(
        TokenType::ULONG,
        "ulong",
        [KeywordMatcher.new(TokenType::LBRACE, "}")]
      )

      token = matcher.matches?(
        Tokenizer::Stream.new(IO::Memory.new("ulong!"))
      )

      token.should be_nil
    end

    it "does not match on non keywords" do
      matcher = KeywordMatcher.new(
        TokenType::ULONG,
        "ulong"
      )

      token = matcher.matches?(
        Tokenizer::Stream.new(IO::Memory.new("adasd"))
      )

      token.should be_nil
    end

    it "matches ulong" do
      matcher = KeywordMatcher.new(
        TokenType::ULONG,
        "ulong"
      )

      token = matcher.matches?(
        Tokenizer::Stream.new(IO::Memory.new("ulong"))
      )

      token.should eq(Token.new(TokenType::ULONG, "ulong"))
    end

    it "matches ushort" do
      matcher = KeywordMatcher.new(
        TokenType::USHORT,
        "ushort"
      )

      token = matcher.matches?(
        Tokenizer::Stream.new(IO::Memory.new("ushort"))
      )

      token.should eq(Token.new(TokenType::USHORT, "ushort"))
    end

    it "matches removed" do
      matcher = KeywordMatcher.new(
        TokenType::REMOVED,
        "removed"
      )

      token = matcher.matches?(
        Tokenizer::Stream.new(IO::Memory.new("removed"))
      )

      token.should eq(Token.new(TokenType::REMOVED, "removed"))
    end

    it "matches obsolete" do
      matcher = KeywordMatcher.new(
        TokenType::OBSOLETE,
        "obsolete"
      )

      token = matcher.matches?(
        Tokenizer::Stream.new(IO::Memory.new("obsolete"))
      )

      token.should eq(Token.new(TokenType::OBSOLETE, "obsolete"))
    end

    it "matches uint" do
      matcher = KeywordMatcher.new(
        TokenType::UINT,
        "uint"
      )

      token = matcher.matches?(
        Tokenizer::Stream.new(IO::Memory.new("uint"))
      )

      token.should eq(Token.new(TokenType::UINT, "uint"))
    end

    it "matches int" do
      matcher = KeywordMatcher.new(
        TokenType::INT,
        "int"
      )

      token = matcher.matches?(
        Tokenizer::Stream.new(IO::Memory.new("int"))
      )

      token.should eq(Token.new(TokenType::INT, "int"))
    end

    it "matches enum" do
      matcher = KeywordMatcher.new(
        TokenType::ENUM,
        "enum"
      )

      token = matcher.matches?(
        Tokenizer::Stream.new(IO::Memory.new("enum"))
      )

      token.should eq(Token.new(TokenType::ENUM, "enum"))
    end

    it "matches byte" do
      matcher = KeywordMatcher.new(
        TokenType::BYTE,
        "byte"
      )

      token = matcher.matches?(
        Tokenizer::Stream.new(IO::Memory.new("byte"))
      )

      token.should eq(Token.new(TokenType::BYTE, "byte"))
    end

    it "does not mistake words for keywords" do
      matcher = KeywordMatcher.new(
        TokenType::CLASS,
        "class",
        [KeywordMatcher.new(TokenType::LBRACE, "}")]
      )

      token = matcher.matches?(
        Tokenizer::Stream.new(IO::Memory.new("classic"))
      )

      token.should be_nil
    end

    it "can match on keywords" do
      matcher = KeywordMatcher.new(TokenType::CLASS, "class")

      token = matcher.matches?(
        Tokenizer::Stream.new(IO::Memory.new("class"))
      )

      token.should eq(Token.new(TokenType::CLASS, "class"))
    end
  end
end

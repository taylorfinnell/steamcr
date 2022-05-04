require "./matcher/matcher"
require "./matcher/*"

module Steamcr::SteamLanguage::Lexer
  class Lex
    include Enumerable(Token)

    @stream : Tokenizer::Stream
    @matchers : Array(Matcher)

    def initialize(@io : IO)
      @stream = Tokenizer::Stream.new(io)

      special_character_matchers = [
        Matcher::KeywordMatcher.new(TokenType::LBRACE, "{"),
        Matcher::KeywordMatcher.new(TokenType::RBRACE, "}"),
        Matcher::KeywordMatcher.new(TokenType::LBRACKET, "<"),
        Matcher::KeywordMatcher.new(TokenType::RBRACKET, ">"),
        Matcher::KeywordMatcher.new(TokenType::SEMICOLON, ";"),
        Matcher::KeywordMatcher.new(TokenType::EQUALS, "="),
        Matcher::KeywordMatcher.new(TokenType::NEWLINE, "\n"),
        Matcher::KeywordMatcher.new(TokenType::TAB, "\t"),
        Matcher::KeywordMatcher.new(TokenType::CRETURN, "\r"),
        Matcher::KeywordMatcher.new(TokenType::PIPE, "|"),
      ]

      keyword_matchers = [
        Matcher::KeywordMatcher.new(TokenType::CLASS, "class",
          special_character_matchers),
        Matcher::KeywordMatcher.new(TokenType::ENUM, "enum",
          special_character_matchers),
        Matcher::KeywordMatcher.new(TokenType::INT, "int",
          special_character_matchers),
        Matcher::KeywordMatcher.new(TokenType::UINT, "uint",
          special_character_matchers),
        Matcher::KeywordMatcher.new(TokenType::REMOVED, "removed",
          special_character_matchers),
        Matcher::KeywordMatcher.new(TokenType::OBSOLETE, "obsolete",
          special_character_matchers),
        Matcher::KeywordMatcher.new(TokenType::USHORT, "ushort",
          special_character_matchers),
        Matcher::KeywordMatcher.new(TokenType::ULONG, "ulong",
          special_character_matchers),
        Matcher::KeywordMatcher.new(TokenType::BYTE, "byte",
          special_character_matchers),
        Matcher::KeywordMatcher.new(TokenType::IMPORT, "#import",
          special_character_matchers),
      ]

      @matchers = [] of Matcher
      @matchers += special_character_matchers
      @matchers += keyword_matchers
      @matchers += [Matcher::WhitespaceMatcher.new]
      @matchers += [Matcher::NumberMatcher.new,
                    Matcher::StringMatcher.new,
                    Matcher::CommentMatcher.new,
                    Matcher::WordMatcher.new(special_character_matchers)]
    end

    def run
      to_a
    end

    def each
      current = advance

      while current != nil && current.not_nil!.type != TokenType::EOF
        if current.not_nil!.type != TokenType::NEWLINE && current.not_nil!.type != TokenType::TAB && current.not_nil!.type != TokenType::WHITESPACE && current.not_nil!.type != TokenType::CRETURN
          yield current.not_nil!
        end
        current = advance
      end
    end

    private def advance
      if @stream.eof?
        Token.new(TokenType::EOF)
      else
        matches = @matchers.each do |matcher|
          match = matcher.matches?(@stream)
          return match if match
        end
        nil
      end
    end
  end
end

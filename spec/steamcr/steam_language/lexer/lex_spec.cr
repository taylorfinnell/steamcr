require "../../../spec_helper"

module Steamcr::SteamLanguage::Lexer
  describe Lex do
    it "ignores newlines tabs and whitespace and carriage returns" do
      io = IO::Memory.new(" \n \t\r ")
      lexer = Lex.new(io)
      tokens = lexer.run

      tokens.should eq([] of Token)
    end

    it "handles imports" do
      io = IO::Memory.new(<<-EOF
        #import "emsg.steamd"
      EOF
      )
      lexer = Lex.new(io)
      tokens = lexer.run

      tokens.should eq([
        Token.new(TokenType::IMPORT, "#import"),
        Token.new(TokenType::STRING, "emsg.steamd"),
      ])
    end

    it "can lex keywords" do
      io = IO::Memory.new("{}<>;=|")
      lexer = Lex.new(io)
      tokens = lexer.run

      tokens.should eq([
        Token.new(TokenType::LBRACE, "{"),
        Token.new(TokenType::RBRACE, "}"),
        Token.new(TokenType::LBRACKET, "<"),
        Token.new(TokenType::RBRACKET, ">"),
        Token.new(TokenType::SEMICOLON, ";"),
        Token.new(TokenType::EQUALS, "="),
        Token.new(TokenType::PIPE, "|"),
      ])
    end

    it "can lex a class with type" do
      io = IO::Memory.new("class MsgClientJustStrings<EMsg::Invalid> {}")
      lexer = Lex.new(io)
      tokens = lexer.run

      tokens.should eq([
        Token.new(TokenType::CLASS, "class"),
        Token.new(TokenType::IDENTIFIER, "MsgClientJustStrings"),
        Token.new(TokenType::LBRACKET, "<"),
        Token.new(TokenType::IDENTIFIER, "EMsg::Invalid"),
        Token.new(TokenType::RBRACKET, ">"),
        Token.new(TokenType::LBRACE, "{"),
        Token.new(TokenType::RBRACE, "}"),
      ])
    end

    it "can lex a variable with a flag, length special type" do
      io = IO::Memory.new("proto<headerLength> SteamKit2.GC.Internal.CMsgProtoBufHeader proto;")
      lexer = Lex.new(io)
      tokens = lexer.run

      tokens.should eq([
        Token.new(TokenType::IDENTIFIER, "proto"),
        Token.new(TokenType::LBRACKET, "<"),
        Token.new(TokenType::IDENTIFIER, "headerLength"),
        Token.new(TokenType::RBRACKET, ">"),
        Token.new(TokenType::IDENTIFIER, "SteamKit2.GC.Internal.CMsgProtoBufHeader"),
        Token.new(TokenType::IDENTIFIER, "proto"),
        Token.new(TokenType::SEMICOLON, ";"),
      ])
    end

    it "matches strings" do
      io = IO::Memory.new("\"test\"")
      lexer = Lex.new(io)
      tokens = lexer.run

      tokens.should eq([
        Token.new(TokenType::STRING, "test"),
      ])
    end

    it "can lex class with braces" do
      io = IO::Memory.new("class blah {};")
      lexer = Lex.new(io)
      tokens = lexer.run

      tokens.should eq([
        Token.new(TokenType::CLASS, "class"),
        Token.new(TokenType::IDENTIFIER, "blah"),
        Token.new(TokenType::LBRACE, "{"),
        Token.new(TokenType::RBRACE, "}"),
        Token.new(TokenType::SEMICOLON, ";"),
      ])
    end

    it "can handle removed" do
      io = IO::Memory.new("class \nname { int x = 1; removed};")
      lexer = Lex.new(io)
      tokens = lexer.run

      tokens.should eq([
        Token.new(TokenType::CLASS, "class"),
        Token.new(TokenType::IDENTIFIER, "name"),
        Token.new(TokenType::LBRACE, "{"),
        Token.new(TokenType::INT, "int"),
        Token.new(TokenType::IDENTIFIER, "x"),
        Token.new(TokenType::EQUALS, "="),
        Token.new(TokenType::INT, "1"),
        Token.new(TokenType::SEMICOLON, ";"),
        Token.new(TokenType::REMOVED, "removed"),
        Token.new(TokenType::RBRACE, "}"),
        Token.new(TokenType::SEMICOLON, ";"),
      ])
    end

    it "matches full classes" do
      io = IO::Memory.new("class \nname { int x = 1; removed};")
      lexer = Lex.new(io)
      tokens = lexer.run

      tokens.should eq([
        Token.new(TokenType::CLASS, "class"),
        Token.new(TokenType::IDENTIFIER, "name"),
        Token.new(TokenType::LBRACE, "{"),
        Token.new(TokenType::INT, "int"),
        Token.new(TokenType::IDENTIFIER, "x"),
        Token.new(TokenType::EQUALS, "="),
        Token.new(TokenType::INT, "1"),
        Token.new(TokenType::SEMICOLON, ";"),
        Token.new(TokenType::REMOVED, "removed"),
        Token.new(TokenType::RBRACE, "}"),
        Token.new(TokenType::SEMICOLON, ";"),
      ])
    end

    it "matches full classes comment" do
      io = IO::Memory.new("class \nname { int x = 1; removed \"test\"};")
      lexer = Lex.new(io)
      tokens = lexer.run

      tokens.should eq([
        Token.new(TokenType::CLASS, "class"),
        Token.new(TokenType::IDENTIFIER, "name"),
        Token.new(TokenType::LBRACE, "{"),
        Token.new(TokenType::INT, "int"),
        Token.new(TokenType::IDENTIFIER, "x"),
        Token.new(TokenType::EQUALS, "="),
        Token.new(TokenType::INT, "1"),
        Token.new(TokenType::SEMICOLON, ";"),
        Token.new(TokenType::REMOVED, "removed"),
        Token.new(TokenType::STRING, "test"),
        Token.new(TokenType::RBRACE, "}"),
        Token.new(TokenType::SEMICOLON, ";"),
      ])
    end

    it "matches negative" do
      io = IO::Memory.new("\tX = -1;")
      lexer = Lex.new(io)
      tokens = lexer.run

      tokens.should eq([
        Token.new(TokenType::IDENTIFIER, "X"),
        Token.new(TokenType::EQUALS, "="),
        Token.new(TokenType::INT, "-1"),
        Token.new(TokenType::SEMICOLON, ";"),
      ])
    end

    it "matches removed" do
      io = IO::Memory.new("\tX = 1; removed\n")
      lexer = Lex.new(io)
      tokens = lexer.run

      tokens.should eq([
        Token.new(TokenType::IDENTIFIER, "X"),
        Token.new(TokenType::EQUALS, "="),
        Token.new(TokenType::INT, "1"),
        Token.new(TokenType::SEMICOLON, ";"),
        Token.new(TokenType::REMOVED, "removed"),
      ])
    end

    it "matches obsolete" do
      io = IO::Memory.new("\tX = 1; obsolete \"foo\"\n")
      lexer = Lex.new(io)
      tokens = lexer.run

      tokens.should eq([
        Token.new(TokenType::IDENTIFIER, "X"),
        Token.new(TokenType::EQUALS, "="),
        Token.new(TokenType::INT, "1"),
        Token.new(TokenType::SEMICOLON, ";"),
        Token.new(TokenType::OBSOLETE, "obsolete"),
        Token.new(TokenType::STRING, "foo"),
      ])
    end

    it "not mistake words for keywords" do
      io = IO::Memory.new("classical")
      lexer = Lex.new(io)
      tokens = lexer.run

      tokens.should eq([
        Token.new(TokenType::IDENTIFIER, "classical"),
      ])
    end

    it "can match constants" do
      io = IO::Memory.new("ulong sourceJobID = ulong.MaxValue;")
      lexer = Lex.new(io)
      tokens = lexer.run

      tokens.should eq([
        Token.new(TokenType::ULONG, "ulong"),
        Token.new(TokenType::IDENTIFIER, "sourceJobID"),
        Token.new(TokenType::EQUALS, "="),
        Token.new(TokenType::HEX, "0xFFFFFFFFFFFFFFFF"),
        Token.new(TokenType::SEMICOLON, ";"),
      ])
    end

    it "can lex enum and class" do
      io = IO::Memory.new("class blah {}; enum lol {};")
      lexer = Lex.new(io)
      tokens = lexer.run

      tokens.should eq([
        Token.new(TokenType::CLASS, "class"),
        Token.new(TokenType::IDENTIFIER, "blah"),
        Token.new(TokenType::LBRACE, "{"),
        Token.new(TokenType::RBRACE, "}"),
        Token.new(TokenType::SEMICOLON, ";"),

        Token.new(TokenType::ENUM, "enum"),
        Token.new(TokenType::IDENTIFIER, "lol"),
        Token.new(TokenType::LBRACE, "{"),
        Token.new(TokenType::RBRACE, "}"),
        Token.new(TokenType::SEMICOLON, ";"),
      ])
    end
  end
end

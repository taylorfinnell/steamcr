module Steamcr::SteamLanguage
  enum TokenType
    BYTE
    CLASS
    COMMENT
    CRETURN
    ENUM
    EOF
    EQUALS
    FLOAT
    HEX
    IDENTIFIER
    IMPORT
    INT
    LBRACE
    LBRACKET
    NEWLINE
    REMOVED
    OBSOLETE
    PIPE
    RBRACE
    RBRACKET
    SEMICOLON
    STRING
    TAB
    UINT
    ULONG
    USHORT
    WHITESPACE
  end

  class Token
    @type : TokenType
    @value : String

    getter type
    getter value

    def initialize(@type, @value = "")
    end

    def to_s(io : IO)
      io << "type: #{type}, value: '#{value}'"
    end

    def_equals @type, @value
  end
end

require "./parser/node"
require "./parser/*"

module Steamcr::SteamLanguage
  class Parser
    @tokens : Array(Token)
    @program : Program

    def initialize(@io : IO)
      @tokens = [] of Token
      @lexer = Lexer::Lex.new(@io)
      @program = Program.new
    end

    def classes
      @program.children.select { |c| c.is_a?(ClassNode) }
    end

    def enums
      @program.children.select { |c| c.is_a?(EnumNode) }
    end

    def imports
      @program.children.select { |c| c.is_a?(ImportNode) }
    end

    def parse
      @tokens = @lexer.to_a

      while @tokens.size != 0
        token = @tokens.shift

        case token.type
        when TokenType::IMPORT
          name = expect(TokenType::STRING)
          import = ImportNode.new(name.value)
          @program << import
        when TokenType::CLASS
          name = expect(TokenType::IDENTIFIER)

          type = nil
          if optional(TokenType::LBRACKET)
            type = expect(TokenType::IDENTIFIER, TokenType::UINT,
              TokenType::INT, TokenType::BYTE)
            expect(TokenType::RBRACKET)
          end

          node = ClassNode.new(
            name.value,
            type ? type.value : nil
          )

          @program << node

          parse_inner(node)
        when TokenType::ENUM
          name = expect(TokenType::IDENTIFIER)

          flags = nil
          type = nil
          if optional(TokenType::LBRACKET)
            type = expect(TokenType::IDENTIFIER, TokenType::UINT,
              TokenType::INT, TokenType::BYTE)
            expect(TokenType::RBRACKET)
          else
            flags = optional(TokenType::IDENTIFIER)
          end

          node = EnumNode.new(
            name.value,
            flags ? flags.value == "flags" : nil,
            type ? type.value : nil
          )

          @program << node
          parse_inner(node)
        end
      end
      @program
    end

    private def parse_inner(parent)
      return if optional(TokenType::REMOVED)
      expect(TokenType::LBRACE)
      right_brace = optional(TokenType::RBRACE)

      while right_brace.nil?
        token_one = @tokens.shift # potential flag type
        start_flag_opts = optional(TokenType::LBRACKET)

        flag_opts = nil
        if start_flag_opts
          flag_opts = expect(TokenType::IDENTIFIER, TokenType::INT, TokenType::HEX)
          expect(TokenType::RBRACKET)
        end

        token_two = optional(TokenType::IDENTIFIER, TokenType::UINT, TokenType::BYTE,
          TokenType::INT, TokenType::ULONG, TokenType::USHORT)
        token_three = optional(TokenType::IDENTIFIER, TokenType::UINT, TokenType::BYTE,
          TokenType::INT, TokenType::ULONG, TokenType::USHORT)

        var, type, flags = nil, nil, nil
        if token_three
          var = token_three
          type = token_two
          flags = token_one
        elsif token_two
          var = token_two
          type = token_one
        else
          var = token_one
        end

        equals = optional(TokenType::EQUALS)

        vals = [] of String
        if equals
          loop do
            symbol_val = optional(TokenType::IDENTIFIER)
            val = optional(TokenType::HEX, TokenType::INT, TokenType::UINT,
              TokenType::BYTE, TokenType::IDENTIFIER)

            if symbol_val
              pipe = optional(TokenType::PIPE)
              vals << symbol_val.value
              next if pipe
            end

            vals << val.value if val

            expect(TokenType::SEMICOLON)
            break
          end
        else
          expect(TokenType::SEMICOLON)
        end

        obsolete = optional(TokenType::REMOVED) || optional(TokenType::OBSOLETE)
        reason = optional(TokenType::STRING)

        optional(TokenType::SEMICOLON)

        defintion = DefinitionNode.new(
          var.value,
          vals.size >= 1 ? vals.join(" | ") : nil,
          type ? type.value : nil,
          flags ? flags.value : nil,
          flag_opts ? flag_opts.value : nil,
          obsolete != nil,
          reason ? reason.value : nil
        )
        parent << defintion

        right_brace = optional(TokenType::RBRACE)
      end
    end

    private def expect(*types)
      token = peek

      if types.includes?(token.type)
        @tokens.shift.not_nil!
      else
        raise "expected #{types.join(" or ")}, got #{token.type} (#{token})"
      end
    end

    private def expect(type)
      token = peek

      if token.type == type
        @tokens.shift.not_nil!
      else
        raise "expected #{type} got #{token.type} #{token}"
      end
    end

    private def optional(type)
      token = peek

      if token.type == type
        @tokens.shift.not_nil!
      else
        nil
      end
    end

    private def optional(*types)
      token = peek

      if types.includes?(token.type)
        @tokens.shift.not_nil!
      else
        nil
      end
    end

    private def peek
      return Token.new(TokenType::EOF, "") if @tokens.size == 0
      @tokens.first
    end
  end
end

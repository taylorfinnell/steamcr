require "./generator/code_generator"
require "./generator/*"

require "compiler/crystal/formatter"

module Steamcr::SteamLanguage
  # Generates crystal code from the steam lang
  class Compiler
    def initialize(@gen : Generator::AbstractGenerator)
    end

    def prelude
      @gen.emit_prelude
    end

    def visit(node : Parser::ClassNode)
      @gen.emit_class(node)
    end

    def visit(node : Parser::EnumNode)
      @gen.emit_enum(node)
    end

    def visit(node : Parser::ImportNode)
      @gen.emit_import(node)
    end

    def compile(io : IO, output_io : IO)
      parser = Parser.new(io)
      ast = parser.parse

      code = String.build do |source|
        traverse(ast, source)
      end

      output_io << @gen.format(code)
    end

    private def traverse(ast, source)
      ast.children.each do |c|
        source << visit(c)
      end
    end
  end
end

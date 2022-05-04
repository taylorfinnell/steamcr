require "../../spec_helper"

module Steamcr::SteamLanguage
  class FakeGenerator
    include Generator::AbstractGenerator

    def emit_class(node : Parser::ClassNode)
      emit_ns("test") { node.name }
    end

    def emit_enum(node : Parser::EnumNode)
      node.name
    end

    def format(code : String)
      code.underscore
    end

    def emit_import(import : Parser::ImportNode)
      import.name
    end

    def emit_prelude
      "prelude"
    end

    def emit_ns(ns, &block)
      String.build do |code|
        code << "module #{ns}\n"
        code << yield
        code << "end"
      end
    end
  end

  describe Compiler do
    describe "compile" do
      it "generates reasonable code" do
        output = IO::Memory.new

        compiler = Compiler.new(Generator::CrystalGenerator.new)
        compiler.compile(
          IO::Memory.new("#import \"lol\" class Test {}; enum Sup {}"),
          output
        )

        output.rewind

        code = <<-T
               require "./lol"

               module Steamcr
                 class Test
                   def initialize
                   end
                 end
               end

               module Steamcr
                 enum Sup
                 end
               end

               T
        output.gets_to_end.should eq(code)
      end
    end
  end
end

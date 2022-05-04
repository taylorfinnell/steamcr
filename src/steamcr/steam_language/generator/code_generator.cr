module Steamcr::SteamLanguage
  module Generator
    module AbstractGenerator
      abstract def emit_class(node : Parser::ClassNode)
      abstract def emit_enum(node : Parser::EnumNode)
      abstract def emit_import(node : Parser::ImportNode)
      abstract def emit_prelude
      abstract def format(code : String)
      abstract def emit_ns(ns, &block)

      def indent(times = 1, &block)
        String.build do |code|
          code << (("  " * times) + yield)
        end
      end
    end
  end
end

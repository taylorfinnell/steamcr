module Steamcr::SteamLanguage
  class Parser
    class EnumNode
      include Node(DefinitionNode)

      getter name
      getter flags
      getter type

      def initialize(@name : String, @flags : Bool? = nil, @type : String? = nil, children = [] of DefinitionNode)
        @children = children
      end

      def to_s(io : IO)
        type = @type ? "<#{@type}>" : ""
        io << "enum #{@name}#{type}"
        io << "\n"
        io << "{"
        io << "\n"
        @children.each do |child|
          io << "\t"
          io << child.to_s
          io << "\n"
        end
        io << "};"
      end

      def_equals @name, @children
    end
  end
end

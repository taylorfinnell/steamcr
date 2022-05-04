require "./definition_node"

module Steamcr::SteamLanguage
  class Parser
    class ClassNode
      include Node(DefinitionNode)

      getter name
      getter type

      def initialize(@name : String, @type : String? = nil, children = [] of DefinitionNode)
        @children = children
      end

      def to_s(io : IO)
        type = @type ? "<#{@type}>" : ""
        io << "class #{@name}#{type}"
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

      def_equals @name, @children, @type
    end
  end
end

module Steamcr::SteamLanguage
  class Parser
    class DefinitionNode
      getter name
      getter value
      getter obsolete
      getter reason
      getter type
      getter flags
      getter flag_opts

      def initialize(@name : String, @value : String? = nil, @type : String? = nil,
                     @flags : String? = nil, @flag_opts : String? = nil, @obsolete : Bool = false, @reason : String? = nil)
      end

      def to_s(io : IO)
        flags = ""
        flags += "#{@flags}" if @flags
        flags += "<#{@flag_opts}>" if @flag_opts && @flags
        size = "<#{@flag_opts}>" if @flag_opts && !@flags

        if @value
          io << "#{flags} #{@type}#{size} #{@name} = #{@value};"
        else
          io << "#{flags} #{@type}#{size} #{@name};"
        end
      end

      def_equals @name, @value, @obsolete, @reason, @type, @flags, @flag_opts
    end
  end
end

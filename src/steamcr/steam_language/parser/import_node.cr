module Steamcr::SteamLanguage
  class Parser
    class ImportNode
      getter name

      def initialize(@name : String)
      end

      def name
        return @name unless @name.includes?(".")
        name, ext = @name.split(".")
        name
      end
    end
  end
end

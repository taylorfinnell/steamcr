module Steamcr::SteamLanguage
  class Parser
    module Node(T)
      include Enumerable(T)

      @children = [] of T

      getter children

      def each
        @children.each do |c|
          yield c
        end
      end

      def <<(k)
        @children << k
      end
    end
  end
end

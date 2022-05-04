module Steamcr::SteamLanguage
  class Parser
    class Program
      include Node(ClassNode | EnumNode | ImportNode)
    end
  end
end

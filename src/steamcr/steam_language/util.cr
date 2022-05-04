module Steamcr::SteamLanguage
  class Util
    def self.empty_or_nil?(char : String?)
      ["", " "].includes?(char.to_s)
    end

    def self.escaped_char?(char : String?)
      ["\t", "\n", "\r"].includes?(char.to_s)
    end
  end
end

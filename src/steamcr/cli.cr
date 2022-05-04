require "./cli/*"

module Steamcr
  class CLI
    def initialize
    end

    def run
      args = ARGV
      return unless args.any?

      case args.first
      when "generate_steamd"
        cmd = CLI::GenerateSteamLanguage.new
        cmd.run(args)
      when "generate_proto"
        cmd = CLI::GenerateProto.new
        cmd.run(args)
      end
    end
  end
end

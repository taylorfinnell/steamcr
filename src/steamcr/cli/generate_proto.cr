require "random/secure"

module Steamcr
  class CLI
    class GenerateProto
      PROTOS = {
        "csgo" => [
          "steammessages",
          "engine_gcmessages",
          "cstrike15_gcmessages",
          "cstrike15_usermessages",
          "netmessages",
          "gcsdk_gcmessages",
          "gcsystemmsgs",
        ],
        "steam" => [
          "steammessages_base",
          "steammessages_clientserver_login",
          "encrypted_app_ticket",
          "steammessages_clientserver_2",
          "steammessages_clientserver_friends",
          "steammessages_clientserver",
        ],
      }

      def run(args)
        base_url = "https://raw.githubusercontent.com/SteamDatabase/Protobufs/master"

        PROTOS.each do |game, files|
          `mkdir -p ./proto/#{game}`
          files.each { |file| `curl -L #{base_url}/#{game}/#{file}.proto -o ./proto/#{game}/#{file}.proto` }
        end

        PROTOS.each do |game, files|
          ns = game.capitalize

          files.each do |file|
            `mkdir -p ./generated/#{game}`
            `PROTOBUF_NS=#{ns} protoc -I ./proto/#{game}/ --crystal_out ./generated/#{game} #{file}.proto`
          end
        end
      end
    end
  end
end

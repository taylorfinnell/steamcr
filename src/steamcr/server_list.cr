module Steamcr
  # Represents a list of Servers we can connect to. There are a few
  # defaults but an instance of this list should be updated as
  # servers are sent down from Steam.
  #
  # @example Getting a random server
  #   list = ServerList.new
  #   list.sample # => Server
  class ServerList
    include Enumerable(Server)

    # Instantiate a ServerList. Adds at least one Server object
    # to the list
    #
    # @todo Add more servers
    def initialize
      @servers = [
        # 162.254.192.101:27019
        Server.new("162.254.192.109", 27017),
      ]
    end

    # Iterates over each Server in the list
    #
    # @example Iterating a server list
    #   list = ServerList.new
    #   list.each do |server|
    #     puts server.host
    #   end
    def each(&block : Server ->)
      @servers.each(&block)
    end
  end
end

module Steamcr
  # Represents a Steam server we can use
  # @example Creating server object
  #   server = Server.new('127.0.0.1', 123)
  #   puts server.host # => '127.0.0.1'
  #   puts server.port # => 123
  #
  # @see Networking::Connection
  class Server
    # The host IP of the Steam server
    getter :host

    # The host port of the Steam server
    getter :port

    # Instantiate a Server
    #
    # @param host [String] the server host
    # @param port [String] the server port
    def initialize(@host : String, @port : Int32)
      @host = host
      @port = port
    end
  end
end

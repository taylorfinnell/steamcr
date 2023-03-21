module Steamcr
  module Networking
    abstract class Connection

      abstract def connect(server : Server)
      abstract def close
      abstract def read : Bytes?
      abstract def write(data : Bytes)
    end
  end
end

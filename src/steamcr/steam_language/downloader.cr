require "http/client"
require "json"
require "base64"
require "file_utils"

module Steamcr::SteamLanguage
  class Downloader
    class File
      include JSON::Serializable

      @[JSON::Field]
      @content : String

      @[JSON::Field]
      @encoding : String

      property content
      property encoding
    end

    class FileRef
      include JSON::Serializable

      @[JSON::Field]
      @path : String

      @[JSON::Field]
      @url : String?

      property url
      property path
    end

    class ApiResponse
      include JSON::Serializable

      @[JSON::Field]
      @tree : Array(FileRef)

      property tree
    end

    def download(location)
      http = HTTP::Client.get(url)
      raise http.body.to_s unless http.status_code == 200
      resp = ApiResponse.from_json(http.body)

      file_refs = resp.tree.select do |ref|
        ref.path =~ /^Resources\/SteamLanguage\/.*steamd/
      end

      file_refs.each do |file_ref|
        http = HTTP::Client.get(file_ref.url.not_nil!)
        raise http.body.to_s unless http.status_code == 200
        file = File.from_json(http.body)
        raise "unsupported encoding" unless file.encoding == "base64"
        content = Base64.decode_string(file.content)
        filename = ::File.basename(file_ref.path)
        ::File.open("#{location}/#{filename}", "w") do |f|
          f.puts(content)
        end
      end
      p location
    end

    private def url
      "https://api.github.com/repos/SteamRE/SteamKit/git/trees/master?recursive=1"
    end
  end
end

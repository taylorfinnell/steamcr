module Steamcr
  # Represents a Sentry file on disk
  #
  # @todo this will overwrite any existing file, namespace
  #   to username?
  class SentryFile
    # Writes the digest to the sentry file
    #
    # @example Write the SentryFile
    #   file = SentryFile.new
    #   file.write('sha1digest')
    #
    # @param digest [String]
    def write(digest)
      File.open(path, "wb") do |file|
        file.write(digest)
      end
    end

    # Read the digest from the sentry file. Returns
    # nil if the Sentry file does not exist.
    #
    # @example Read the SentryFile
    #   file = SentryFile.new
    #   file.read # => 'somedigest'
    #
    # @return [String,nil]
    def read
      return nil unless File.exists?(path)

      File.open(path) do |f|
        f.getb_to_end
      end
    end

    private def path
      "/tmp/.steam-sentry"
    end
  end
end

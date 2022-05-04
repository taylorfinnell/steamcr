require "random/secure"

module Steamcr
  class CLI
    class GenerateSteamLanguage
      def run(args)
        download_language
        generate_language

        puts "Generated steamd."
      end

      private def download_language
        Steamcr::SteamLanguage::Downloader
          .new
          .download(input_dir)
      end

      private def generate_language
        compiler = Steamcr::SteamLanguage::Compiler.new(Steamcr::SteamLanguage::Generator::CrystalGenerator.new)

        File.open("#{output_dir}/prelude.cr", "w") do |file|
          file.puts(compiler.prelude)
        end

        files = Dir.glob(File.expand_path("#{input_dir}/*.steamd")).to_a
        files_names = files.map do |file|
          filename, ext = File.basename(file).split(".")
          "#{filename}.cr"
        end

        files.each_with_index do |steamd, index|
          filename = files_names[index]
          File.open("#{output_dir}/#{filename}", "w") do |file|
            compiler.compile(File.open(steamd), file)
          end
        end

        File.write("#{output_dir}/steamd.cr",
          (["prelude.cr"] + files_names).map { |f| "require \"./#{f.split(".").first}\"" }.join("\n"))
      end

      private def input_dir : String
        @input_dir ||= begin
          dir = "/tmp/#{Random::Secure.hex}"
          FileUtils.mkdir_p(dir)
          dir.as(String)
        end
      end

      private def output_dir
        File.join(File.expand_path(File.dirname(__FILE__)), "..", "..", "steamd")
      end
    end
  end
end

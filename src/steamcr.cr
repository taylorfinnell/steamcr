require "../generated/**"
require "./steamd/*"
require "./steamcr/base/*"
require "./steamcr/client"
require "./steamcr/*"

module Steamcr
  cli = CLI.new
  cli.run if ENV["CLI"]?
end

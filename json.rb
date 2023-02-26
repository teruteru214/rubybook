require "net/http"
require "uri"
url = URI.parse("https://igarashikuniaki.net/example.json")
puts Net::HTTP.get(url)

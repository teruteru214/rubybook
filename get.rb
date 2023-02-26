require "net/http"
require "uri"
url = URI.parse("https://example.com/")
puts Net::HTTP.get(url)

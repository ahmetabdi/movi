require 'net/http'

puts Net::HTTP.get(URI('http://movienight.ws'))

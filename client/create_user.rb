require 'faraday'
require 'active_support/all'

puts "who do you want to create?"
username = gets.chomp

conn = Faraday.new(:url => 'http://localhost:3000')

response = conn.post do |req|
  req.url '/api/users.json'
  req.headers['Content-Type'] = 'application/json'
  req.body = { user: {name: username}}.deep_stringify_keys.to_json
end

puts response.body.inspect

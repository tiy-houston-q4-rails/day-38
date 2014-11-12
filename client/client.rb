require 'faraday'
require 'pry'
require 'json'

response = Faraday.get 'http://localhost:3000/api/users.json'
json = JSON.parse(response.body)

user = json["users"].find do |user|
  user["name"] == "gielle_medhurst"
end

car_ids = user["car_ids"]
cars = json["cars"].select do |car|
  car_ids.include? car["id"]
end

puts user["name"] + " likes :"

puts cars

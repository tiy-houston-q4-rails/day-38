# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

["Astrodome", "Williams Tower", "Memorial Park", "George R Brown", "Start Houston"].each do |name|
  # hash = Geocoder.search(name).first.data["geometry"]["location"]
  # lat = hash["lat"]
  # lng = hash["lng"]

  Point.create name: name#, lat: lat, lng: lng
end

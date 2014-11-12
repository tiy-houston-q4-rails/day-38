# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# accord = Car.create make: "honda", model: "accord"
# cherokee = Car.create make: "jeep", model: "cherokee"
# big_ass_truck = Car.create make: "ford", model: "big-ass-truck"
# mazda = Car.create make: "mazda", model: "small"
# tesla = Car.create make: "tesla", model: "S"
# corvette = Car.create make: "chevy", model: "corvette"
#
# jwo = User.create name: "jwo"
# chunda = User.create name: "chunda"
# ben = User.create name: "ben"
# dwight = User.create name: "Dwight"
#
# jwo.cars << accord
# jwo.cars << tesla
# ben.cars << corvette
# ben.cars << tesla
# chunda.cars << mazda

10.times do
  Car.create make: Faker::Company.name, model: Faker::Company.suffix
end

500.times do
  User.create name: Faker::Internet.user_name
end

User.all.each do |user|
  cars = Car.all.limit(rand(1..10))
  cars.each do |car|
    user.cars << car
  end
end

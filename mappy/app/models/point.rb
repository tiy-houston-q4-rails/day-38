class Point < ActiveRecord::Base
  geocoded_by :name,  :latitude => :lat, :longitude => :lng
  after_validation :geocode
end

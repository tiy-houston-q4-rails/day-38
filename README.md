Day 38 -- API and Maps
======================


1. Create a map
2. List some stuff on the map
3. Get map onto heroku


Extra:

1. Create an endpoint to list all your points
2. Create an endpoint to add a point to your mappy map


## To mappify your app

Create a ```<div id=“map”></div>```
Add css and js to your layout
``` <link rel="stylesheet" href="http://cdn.leafletjs.com/leaflet-0.7.3/leaflet.css" />
<script src="http://cdn.leafletjs.com/leaflet-0.7.3/leaflet.js"></script>```
Create in your javascript:
```
$(window).ready(function(){

window.map = L.map('map').setView([29.7601927, -95.36938959999999], 12);

L.tileLayer('https://{s}.tiles.mapbox.com/v3/{id}/{z}/{x}/{y}.png', {
maxZoom: 13,
attribution: 'Map data &copy; <a href="http://openstreetmap.org">OpenStreetMap</a> contributors, ' +
'<a href="http://creativecommons.org/licenses/by-sa/2.0/">CC-BY-SA</a>, ' +
'Imagery © <a href="http://mapbox.com">Mapbox</a>',
id: 'examples.map-i875mjb7'
}).addTo(window.map);

});
```

In your controller with the data:

```
<script>
$(window).ready(function(){
<% @points.each do |point| %>
L.marker([<%= point.lat %>, <%= point.lng %>])
.addTo(window.map)
.bindPopup("<b><%= point.name %></b>");
<% end %>
});
</script>
```


## JSON API Guidelines

Get your data in order
add “active_model_serializers” to gemfile and bundle
rails g serializer car
Add the attributes you want in the new serializer
add “render json: @cars” in controller

Rules:
use jsonapi.org
Split your API controllers from your web controllers

To create URLs like: `http://localhost:3000/api/cars`
create app/controllers/api
create app/controller/api/cars_controller.rb
```
class Api::CarsController < ApplicationController
  def index
    @cars = Car.all
   render json: @cars
  end
end
```
3. in your routes, setup a namespace like so:
```
namespace :api do
  get 'cars' => 'cars#index'
end
```



To allow data into your system:

In your controller, `protect_from_forgery with: :null_session`
Have routes setup as you would expect
controller somewhat normallY:
``` def create
@user = User.new(params.require(:user).permit(:name))
@user.save
render json: @user
end```
HTTP Requests must set [Content-Type: “application/json”] header


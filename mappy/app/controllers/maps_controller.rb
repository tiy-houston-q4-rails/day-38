class MapsController < ApplicationController
  def show
    @points = Point.all
  end
end

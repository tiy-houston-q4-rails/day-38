class Api::PointsController < ApplicationController
  protect_from_forgery with: :null_session

  def create
    @point = Point.new(params.require(:point).permit(:name))
    @point.save
    render json: @point
  end
end

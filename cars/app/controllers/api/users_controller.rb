class Api::UsersController < ApplicationController

  protect_from_forgery with: :null_session

  def index
    @users = User.all
    render json: @users
  end

  def create
    @user = User.new(params.require(:user).permit(:name))
    @user.save
    render json: @user
  end
end

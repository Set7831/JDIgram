class UsersController < ApplicationController

  before_action :authenticate_user!

  def index
    @user = User.all
  end

  def show
    p params
    @user = User.find(params[:id])

  end

  private

  def user_params
    params.require(:user).permit(:email, :image, :password, :username, profile_attributes: [:id, :surname, :name, :patronymic, :date_of_birth])
  end

  def find_user
    @user = User.find(params[:id])
  end
end
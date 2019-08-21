class HomeController < ApplicationController

  before_action :authenticate_user!

  def index
    @user = User.where.not(id: current_user.id)

  end

  private
  def user_params
    params.require(:user).permit(:email, :image, :password, :username, profile_attributes: [:id, :surname, :name, :patronymic, :date_of_birth], posts_attributes: [:text, :image_post])
  end

end

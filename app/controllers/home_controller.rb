class HomeController < ApplicationController



  def index

    @user = User.where.not(id: current_user.id)

  end

  private
  def user_params
    params.require(:user).permit(:email, :image, :password, :username, profile_attributes: [:id, :surname, :name, :patronymic, :date_of_birth])
  end
end

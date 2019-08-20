class ProfileController < ApplicationController

  before_action :authenticate_user!

  def edit

  end

  def show
    @user = User.find(params[:user_id])
    @profile = Profile.find(params[:id])
  end

  def update
    if params[:user][:password].blank?
      params[:user].delete(:password)
      params[:user].delete(:password_confirmation)
    end

    if(current_user.update!(profile_params))
      redirect_to root_path
    else
      render 'edit'
    end
  end

  private

  def profile_params
    params.require(:user).permit(:email, :image, :password, :username, :password_confirmation, :current_password, profile_attributes: [:id, :surname, :name, :patronymic, :date_of_birth])
  end
end
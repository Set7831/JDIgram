class ProfileController < ApplicationController

  before_action :authenticate_user!

  def edit

  end

  def show
    @user = User.find(params[:id])
    @profile = @user.profile
    @post = @user.posts
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

  def create
    @selected = Profile.where(:post_id => params[:like_id])
    respond_to do |format|
      format.js
    end
  end

  private

  def profile_params
    params.require(:profile).permit(:email, :image, :password, :username, :password_confirmation, :current_password, profile_attributes: [:id, :surname, :name, :patronymic, :date_of_birth], posts_attributes: [:text, :image_post])
  end
end
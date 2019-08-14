class ProfilesController < ApplicationController

  before_action :find_user, only: [:index, :new, :show, :edit, :update, :destroy, :create]
  before_action :find_user_profile, only: [:edit, :show, :update, :destroy]

  def index
    @profile = Profile.all
  end

  def show
  end

  def new
    @profile = @user.profile.build
  end

  def edit

  end

  def update
    if(@profile.update(profile_params))
      redirect_to @profile
    else
      render 'edit'
    end
  end

  def destroy
    @profile.destroy
    redirect_to root_path
  end

  def create
    @profile = @user.profile.build(profile_params)
    if(@profile.save)
    redirect_to root_path, notice: "Пользователь успешно создан"
    else
      render 'new'
    end
  end


  private

  def profile_params
    params.require(:profile).permit(:surname, :name, :patronymic, :date_of_birth)
  end

  def find_user
    @user = User.find(params[:user_id])
  end

  def find_user_profile
    @profile = @user.profile.find(params[:id])
  end
end

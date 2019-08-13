class ProfilesController < ApplicationController

  def index
    @profile = Profile.find(params[:id])
  end

  def new

  end

  def create
    @profile = Profile.new(params_profile)
    @profile.save
    redirect_to
  end

  private

  def params_profile
    params.require(:profile).permit(:surname, :name, :patronymic, :date_of_birth)
  end
end

class RegistrationsController < Devise::RegistrationsController

  before_action :configure_permitted_parameters, if: :devise_controller?

  def new
    build_resource()
    self.resource.profile = Profile.new
    respond_with self.resource
  end

  def create
    super
  end

  private

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :password, :username, :password_confirmation, { profile_attributes: [:id, :surname, :name, :patronymic, :date_of_birth] }])
    devise_parameter_sanitizer.permit(:account_update,  keys: [:email, :password, :username, :password_confirmation, { profile_attributes: [:id, :surname, :name, :patronymic, :date_of_birth] }])
  end
end

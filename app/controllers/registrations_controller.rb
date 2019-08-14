class RegistrationsController < Devise::RegistrationsController

  before_action :configure_permitted_parameters, if: :devise_controller?

  #def sign_up_params
  #  devise_parameter_sanitizer.sanitize(:sign_up)
  #  params.require(:user).permit(:email, :password, :username, :password_confirmation, profile_attributes: [:secondname, :name, :patronymic, :date_of_birth])
  #end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit({ roled: []}, :email, :password, :password_confirmation,
                                                               :username , profile_attributes: [:surname, :name, :patronymic, :date_of_birth])}
  end
end

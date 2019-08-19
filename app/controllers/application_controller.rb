class ApplicationController < ActionController::Base

  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(resource)
    root_path
  end

  def after_sign_up_path_for(resource)
    user_profile_index_path
  end

  def after_sign_out_path_for(resource_or_scope)
    root_path
  end



  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :password, :username, :image, :image_cache, :password_confirmation, { profile_attributes: [:id, :surname, :name, :patronymic, :date_of_birth] }])
    devise_parameter_sanitizer.permit(:account_update,  keys: [:email, :password, :username, :image, :image_cache, :password_confirmation, { profile_attributes: [:id, :surname, :name, :patronymic, :date_of_birth] }])
  end
end

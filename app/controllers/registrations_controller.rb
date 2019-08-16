class RegistrationsController < Devise::RegistrationsController

  def new
    build_resource()
    self.resource.profile = Profile.new
    respond_with self.resource
  end

  def create
    super
  end

  def update
    account_update_params = devise_parameter_sanitizer.sanitize(:account_update)
    @user = User.find(current_user.id)

    if needs_password?
      successfully_updated = @user.update_with_password(account_update_params)
    else
      account_update_params.delete('password')
      account_update_params.delete('password_confirmation')
      account_update_params.delete('current_password')
      successfully_updated = @user.update_attributes(account_update_params)
    end

    if successfully_updated
      set_flash_message :notice, :updated
      sign_in @user, :bypass => true
      redirect_to edit_user_registration_path
    else
      render 'edit'
    end
  end

  end

  private

  def needs_password?
    params[:user][:password].present?
  end

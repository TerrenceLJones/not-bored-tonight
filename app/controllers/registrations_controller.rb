class RegistrationsController < Devise::RegistrationsController
  protected

  def after_sign_up_path_for(resource)
    flash.notice = "Welcome to Not Bored Tonight, #{current_user.email}!"
    '/dashboard'
  end
end

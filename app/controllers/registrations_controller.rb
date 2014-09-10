class RegistrationsController < Devise::RegistrationsController
  protected

  def after_sign_up_path_for(resource)
    puts current_user.inspect
    flash.notice = "Welcome to Not Bored Tonight, #{current_user.first_name} #{current_user.last_name}!"
    '/dashboard'
  end
end

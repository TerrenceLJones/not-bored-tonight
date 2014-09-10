class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :configure_permitted_parameters, if: :devise_controller?


  def after_sign_in_path_for(resource)
    flash.notice = "Welcome back, #{current_user.first_name} #{current_user.last_name}!"
    '/dashboard'
  end

  def after_sign_out_path_for(resource_or_scope)
    new_user_session_path
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) do |u|
      u.permit :first_name, :last_name, :email, :password, :password_confirmation
    end

    if params[:action] == 'update'
      devise_parameter_sanitizer.for(:account_update) {
        |u| u.permit(:first_name, :last_name, :email, :password, :password_confirmation, :current_password)
      }
    end
  end

end

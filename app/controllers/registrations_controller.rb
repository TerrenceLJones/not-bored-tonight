class RegistrationsController < Devise::RegistrationsController

  def update_resource(resource, params)
    if current_user.provider == "facebook"
      params.delete("current_password")
      resource.update_without_password(params)
    else
      resource.update_with_password(params)
    end
  end

  protected

  def after_sign_up_path_for(resource)
    flash.notice = "Welcome to Not Bored Tonight, #{current_user.first_name}
                                                  #{current_user.last_name}!"
    dashboard_path
  end

  def after_update_path_for(resource)
    flash.notice = "Your account has been successfully updated!"
    dashboard_path
  end


end

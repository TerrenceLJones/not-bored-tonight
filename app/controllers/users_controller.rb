class UsersController < ApplicationController

  before_action :authenticate_user!

  def dashboard
    flash.notice = "Welcome #{current_user.email}! It's currently #{Time.new}"
    render 'dashboard'
  end

end

class UsersController < ApplicationController

  before_action :authenticate_user!

  def dashboard
    @user = current_user
    @activities = current_user.activities
    render 'dashboard'
  end
end

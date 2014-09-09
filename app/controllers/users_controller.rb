class UsersController < ApplicationController

  before_action :authenticate_user!

  def dashboard
    flash.notice = "Welcome to Not Bored Tonight, todd@example.com!"
    render 'dashboard'
  end

end

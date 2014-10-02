class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def profile
    @user = current_user
  end

  def user_events
    @user = current_user
    get_eventful(@user.latitude, @user.longitude)
  end
end

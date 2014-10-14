class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def profile
    params[:id] ? @user = User.find(params[:id]) : @user = current_user
  end
end

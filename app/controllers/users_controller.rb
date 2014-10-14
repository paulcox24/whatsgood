class UsersController < ApplicationController
  before_action :set_user, only: [:edit, :update, :destroy]

  def index
    @users = User.all
  end

  def profile
    params[:id] ? @user = User.find(params[:id]) : @user = current_user
  end

  def edit
  end

  def update
    if @user.update(account_update_params)
      redirect_to profile_path
    else
      render :edit
    end  
  end

  def destroy
  end

  private

  def set_user
    @user = User.find(params[:id])
  end  

  def account_update_params
    params.require(:user).permit(:first_name, :latitude, :longitude, :last_name, :address, :description, :email, :password, :password_confirmation, :current_password, :category_ids => [])
  end

end

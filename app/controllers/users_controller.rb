class UsersController < ApplicationController
  before_action :set_user, only: [:edit, :update, :destroy]

  def index
    if current_user.is_admin
      @users = User.all
    else 
      redirect_to root_path, notice: "Not allowed" 
    end 
  end

  def profile
    @user = User.find(params[:user_id])
    # binding.pry
  end

  def edit
  end

  def update
    if current_user.is_admin
      if @user.update(account_update_params)
        redirect_to user_profile_path(@user)
      else
        render :edit
      end  
    else
      redirect_to root_path, notice: "Not allowed"
    end  
  end

  def destroy
    if current_user.is_admin
      @user.destroy 
      redirect_to users_path
    else
      redirect_to root_path, notice: "Not allowed"
    end  
  end

  private

  def set_user
    @user = User.find(params[:id])
  end  

  def account_update_params
    params.require(:user).permit(:avatar, :is_admin, :first_name, :latitude, :longitude, :last_name, :address, :description, :email, :password, :password_confirmation, :current_password, :category_ids => [])
  end

end

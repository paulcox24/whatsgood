class RegistrationsController < Devise::RegistrationsController
  private

  def sign_up_params
    params.require(:user).permit(:first_name, :latitude, :longitude, :last_name, :address, :description, :email, :password, :password_confirmation)
  end

  def account_update_params
    params.require(:user).permit(:category_ids, :first_name, :latitude, :longitude, :last_name, :address, :description, :email, :password, :password_confirmation, :current_password)
  end
end

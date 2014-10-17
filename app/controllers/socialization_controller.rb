class SocializationController < ApplicationController

  def follow
    set_user
    current_user.follow!(@user)

    respond_to do |format|
        format.html { redirect_to user_profile_path(@user) }
        format.js
      end
  end

  def unfollow
    set_user
    current_user.unfollow!(@user)

    respond_to do |format|
        format.html { redirect_to user_profile_path(@user) }
        format.js
      end
  end

  private
  def set_user
    @user = User.find(params['user'])
  end
end

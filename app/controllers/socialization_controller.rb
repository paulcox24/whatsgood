class SocializationController < ApplicationController

  def follow
    current_user.follow!(User.find(params['user']))
  end

  def unfollow
    
  end
end

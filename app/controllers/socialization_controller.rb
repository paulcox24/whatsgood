class SocializationController < ApplicationController

  def follow
    current_user.follow!(User.find(params['user']))
  end

  def unfollow
    current_user.unfollow!(User.find(params['user']))
  end
end

class ActivitiesController < ApplicationController
  def index
    if current_user && current_user.is_admin
      @activities = PublicActivity::Activity.order('created_at desc')
    else 
      redirect_to root_path, notice: "Not allowed" 
    end 
  end
end

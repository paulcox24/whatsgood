class StaticPagesController < ApplicationController
  def home
    if current_user
    	get_eventful(current_user.latitude, current_user.longitude)
    else
      get_eventful('Salt Lake City')
    end  
  end

  def about
  end

  def contact
  end
end

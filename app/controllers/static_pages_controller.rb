class StaticPagesController < ApplicationController
  
  def home
    if current_user
      latlong = "#{current_user.latitude},#{current_user.longitude}"
    	get_eventful(latlong)
    else
      get_eventful('Salt Lake City')
    end  
  end

  def about
  end

  def contact
  end

  def get_eventful(latlong)
    eventful = Eventful::API.new ENV["EVENTFUL_API_KEY"]
    @result = eventful.call 'events/search', :category => 'music', :location => latlong, :within => 5, :date => 'Future', :image_sizes => 'large', :sort_order => 'popularity', :page_size => 20
    @events = @result['events']['event']
  end
end

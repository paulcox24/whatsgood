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

  def get_eventful(latitude, longitude=nil)
    eventful = Eventful::API.new ENV["EVENTFUL_API_KEY"]
    result = eventful.call 'events/search', :category => 'music', :location => "#{latitude},#{longitude}", :within => 5, :date => 'Future', :image_sizes => 'large', :sort_order => 'popularity'
    @events = result['events']['event']
  end
end

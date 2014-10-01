class StaticPagesController < ApplicationController
  def home
  	eventful = Eventful::API.new ENV["EVENTFUL_API_KEY"]
  	result = eventful.call 'events/search', :keywords => 'sports', :location => 'Salt Lake City', :page_size => 5
  	@events = result['events']['event']
  end

  def about
  end

  def contact
  end
end

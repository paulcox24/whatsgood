class ApplicationController < ActionController::Base
	require 'eventful/api'
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def get_eventful(latitude, longitude=nil)
    eventful = Eventful::API.new ENV["EVENTFUL_API_KEY"]
    result = eventful.call 'events/search', :category => 'music', :location => "#{latitude},#{longitude}", :within => 5, :date => 'Future', :image_sizes => 'large'
    @events = result['events']['event']
  end
end

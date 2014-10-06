class StaticPagesController < ApplicationController
  
  def home
    if current_user
      latlong = "#{current_user.latitude},#{current_user.longitude}"
      categories = current_user.categories.collect { |category| category.name }.join(',')
    	get_eventful(latlong, categories)
    else
      default_city = 'Salt Lake City'
      default_categories = 'music,comedy,sports'
      get_eventful(default_city, default_categories)
    end 
    @hash = Gmaps4rails.build_markers(@events) do |event, marker|
      marker.lat event['latitude']
      marker.lng event['longitude']
      marker.infowindow "<h6><a style=padding: 1.25em; href=#{event['url']}>Event Link</a><br>Title: #{event['title']}<br>Venue: #{event['venue_name']}</h6>"
    end 
  end

  def about
  end

  def contact
  end

  def get_eventful(latlong, categories=nil)
    eventful = Eventful::API.new ENV["EVENTFUL_API_KEY"]
    @result = eventful.call 'events/search',
              :category => categories,
              :location => latlong,
              :within => 5,
              :date => 'Future',
              :image_sizes => 'large',
              :sort_order => 'popularity',
              :page_size => 20
    @events = @result['events']['event']
  end
end

class StaticPagesController < ApplicationController
  
  def home
    default_date = 'Future'
    if current_user
      latlong = "#{current_user.latitude},#{current_user.longitude}"
      categories = current_user.categories.collect { |category| category.name }.join(',')
    	get_eventful(latlong, categories, default_date)
    else
      default_city = 'Salt Lake City'
      default_categories = 'music,comedy,sports'
      get_eventful(default_city, default_categories, default_date)
    end  
  end

  def about
  end

  def contact
  end

  def today
    date = 'Today'
    if current_user
      latlong = "#{current_user.latitude},#{current_user.longitude}"
      categories = current_user.categories.collect { |category| category.name }.join(',')
      get_eventful(latlong, categories, date)
    else
      default_city = 'Salt Lake City'
      default_categories = 'music,comedy,sports'
      get_eventful(default_city, default_categories, date)
    end 
  end

  def this_week
    date = 'This Week'
    if current_user
      latlong = "#{current_user.latitude},#{current_user.longitude}"
      categories = current_user.categories.collect { |category| category.name }.join(',')
      get_eventful(latlong, categories, date)
    else
      default_city = 'Salt Lake City'
      default_categories = 'music,comedy,sports'
      get_eventful(default_city, default_categories, date)
    end 
  end  

  def get_eventful(latlong, categories=nil, date=nil)
    eventful = Eventful::API.new ENV["EVENTFUL_API_KEY"]
    @result = eventful.call 'events/search',
              :category => categories,
              :location => latlong,
              :within => 5,
              :date => date,
              :image_sizes => 'large',
              :sort_order => 'popularity',
              :page_size => 20
    @events = @result['events']['event']
  end
end

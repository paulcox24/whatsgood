class StaticPagesController < ApplicationController

  CATEGORIES = 'music,comedy,sports'
  CITY ='Salt Lake City'
  
  def home
    @date = 'Future'
    if current_user
      user_eventful(@date)
    else
      default_eventful(@date)
    end 
    make_map(@events)
  end

  def today
    @date = 'Today'
    if current_user
      user_eventful(@date)
    else
      default_eventful(@date)
    end 
    make_map(@events)
  end

  def this_week
    @date = "This Week"
    if current_user
      user_eventful(@date)
    else
      default_eventful(@date)
    end 
    make_map(@events)
  end  

  def about
    @has_many_data = AppStats.get_has_many_relationships
    @lines_of_code = AppStats.get_lines_of_code
    @files_by_lines_of_code = AppStats.sort_by_lines_of_code

    respond_to do |format|
      format.html
      format.csv do
          headers['Content-Disposition'] = "attachment; filename=\"app_stats\""
          headers['Content-Type'] ||= 'text/csv'
      end
    end
  end

  def contact
  end

  def load_more_results()
    eventful = Eventful::API.new ENV["EVENTFUL_API_KEY"]
    @result = eventful.call 'events/search',
              :category => get_categories,
              :location => get_location,
              :within => 10,
              :date => params['search_date'],
              :image_sizes => 'perspectivecrop290by250',
              :sort_order => 'popularity',
              :page_size => 10,
              :include => 'categories',
              :page_number => params['page_number']
      @events = @result['events']['event']
      #@test = params[:name]
  end

  private
  def get_eventful(latlong, categories=nil, date=nil)
    Rails.logger.debug("Params #{params.inspect}")
    eventful = Eventful::API.new ENV["EVENTFUL_API_KEY"]
    @result = eventful.call 'events/search',
              :category => categories,
              :location => latlong,
              :within => 10,
              :date => date,
              :image_sizes => 'perspectivecrop290by250',
              :sort_order => 'popularity',
              :include => 'categories',
              :page_size => 10
      @events = @result['events']['event']
  end 

  def make_map(events) 
    @hash = Gmaps4rails.build_markers(events) do |event, marker|
      marker.lat event['latitude']
      marker.lng event['longitude']
      marker.title event['title']
      marker.infowindow "<h6><a style=padding: 1.25em; href=#{event['url']}>Event Link</a><br>Title: #{event['title']}<br>Venue: #{event['venue_name']}</h6>"
    end 
  end

  def default_eventful(date)
    default_city = CITY
    default_categories = CATEGORIES
    get_eventful(default_city, default_categories, date)
  end

  def user_eventful(date)
    latlong = "#{current_user.latitude},#{current_user.longitude}"
    categories = current_user.categories.collect { |category| category.name }.join(',')
    get_eventful(latlong, categories, date)
  end

  def get_categories
    current_user ? current_user.categories.collect { |category| category.name }.join(',') : CATEGORIES
  end  

  def get_location
    current_user ? "#{current_user.latitude},#{current_user.longitude}" : CITY
  end  

end
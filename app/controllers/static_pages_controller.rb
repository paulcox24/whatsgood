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
    make_map(@events)
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
    make_map(@events)
  end  
  
  def get_eventful(latlong, categories=nil, date=nil)
    eventful = Eventful::API.new ENV["EVENTFUL_API_KEY"]
    @result = eventful.call 'events/search',
              :category => categories,
              :location => latlong,
              :within => 10,
              :date => date,
              :image_sizes => 'perspectivecrop290by250',
              :sort_order => 'popularity',
              :page_size => 20
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

 #  def gmaps4rails_marker_picture
 #  @markerpic = {
 #  "picture" => , "http://gmaps-utility-library.googlecode.com/svn/trunk/markerclusterer/1.0/images/heart30.png"          # string,  mandatory
 #   "width" =>  , 30         # integer, mandatory
 #   "height" => , 30        # integer, mandatory
 #  }
 # end

end




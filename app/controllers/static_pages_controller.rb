class StaticPagesController < ApplicationController

  CATEGORIES = 'music,comedy,sports'
  CITY ='Salt Lake City'
  
  def home
    @date = 'Future'
    get_eventful(@date)
    make_map(@events)
  end

  def today
    @date = 'Today'
    get_eventful(@date)
    make_map(@events)
  end

  def this_week
    @date = "This Week"
    get_eventful(@date)
    make_map(@events)
  end  

  def about
    @gems_used = ['Devise','Geocoder','Gmaps4rails','Paperclip','Bootstrap','App_stats (custom gem)','Eventfulapi','Omniauth',"Socialization",'Public_activity'].sort
    @apis_used = ['Facebook','GoogleMaps','Eventful','HTML5 Geolocation']
    @js_used = ['Bootcards','Isotope','jQuery','Underscore']
  end

  def stats
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

  def email
    email = params[:email]
    if((email[:name] != "") && (email[:subject] != "") && (email[:email] != "") && (email[:message] != ""))
      UserMailer.contact_email(email).deliver
      UserMailer.contact_confirm(email).deliver
      redirect_to '/static_pages/contact', notice: "Message Sent"
    else
      redirect_to '/static_pages/contact', notice: "All Fields Must Be Complete"
    end
    
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

  def get_current_location
    @hello ='Hellod'
    @lat = params['latitude']
    @long = params['longitude']
    session[:current_location] = "#{@lat},#{@long}"
  end

  private
  def get_eventful(date=nil)
    begin
      eventful = Eventful::API.new ENV["EVENTFUL_API_KEY"]
      @result = eventful.call 'events/search',
            :category => get_categories,
            :location => get_location,
            :within => 10,
            :date => date,
            :image_sizes => 'perspectivecrop290by250',
            :sort_order => 'popularity',
            :include => 'categories',
            :page_size => 10
      @events = @result['events']['event']
    rescue
      @events = false
      end
  end 

   def get_eventful_for_map(date=nil)
    begin
      eventful = Eventful::API.new ENV["EVENTFUL_API_KEY"]
      @result = eventful.call 'events/search',
            :category => get_categories,
            :location => get_location,
            :within => 10,
            :date => date,
            :sort_order => 'popularity',
            :include => 'categories',
            :page_size => 25
      @eventz = @result['events']['event']
    rescue
      @eventz = false
      end
  end 

  def make_map(eventz) 
    if eventz != false
    @hash = Gmaps4rails.build_markers(eventz) do |event, marker|
      marker.lat event['latitude']
      marker.lng event['longitude']
      marker.title event['title']
      marker.infowindow "<h6><a style=padding: 1.25em; href=#{event['url']}>Event Link</a><br>Title: #{event['title']}<br>Venue: #{event['venue_name']}</h6>"
    end 
  end
  end

  def default_eventful(date)
    default_city = CITY
    default_categories = CATEGORIES
    get_eventful(default_city, default_categories, date)
  end

  def user_eventful(date)
    latlong = "#{current_user.latitude},#{current_user.longitude}"
    categories = current_user.categories.collect { |category| category.cat_id }.join(',')
    get_eventful(latlong, categories, date)
  end

  def get_categories
    current_user ? current_user.categories.collect { |category| category.cat_id }.join(',') : CATEGORIES
  end  

  def get_location
    if session[:current_location]
      session[:current_location]
    else
      current_user ? "#{current_user.latitude},#{current_user.longitude}" : CITY
    end  
  end  

end
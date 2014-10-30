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
    @gems_used = ['Devise','Geocoder','Gmaps4rails','Paperclip','Bootstrap','App_stats (custom gem)','Eventfulapi','Omniauth',"Socialization",'Public_activity', 'Will_paginate'].sort
    @apis_used = ['Facebook','GoogleMaps','Eventful','HTML5 Geolocation']
    @js_used = ['Bootcards','Isotope','jQuery','Underscore']
  end

  def stats
    # @has_many_data = AppStats.get_has_many_relationships
    @has_many_data = ['3 app/models/user.rb','2 app/models/category.rb']
    # @lines_of_code = AppStats.get_lines_of_code
    @lines_of_code = 2578
    # @files_by_lines_of_code = AppStats.sort_by_lines_of_code
    @files_by_lines_of_code = %W(261 ./config/initializers/devise.rb
      156 ./db/schema.rb
      145 ./config/initializers/simple_form.rb
      144 ./app/controllers/static_pages_controller.rb
      104 ./spec/spec_helper.rb
      103 ./spec/controllers/users_controller_spec.rb
      103 ./config/environments/production.rb
      92 ./config/routes.rb
      74 ./app/controllers/events_controller.rb
      67 ./app/models/user.rb
      52 ./spec/rails_helper.rb
      52 ./config/environments/development.rb
      51 ./app/controllers/users_controller.rb
      50 ./spec/features/full_story_spec.rb
      45 ./config/initializers/simple_form_bootstrap.rb
      42 ./db/migrate/20140930024646_devise_create_users.rb
      41 ./app/controllers/categories_controller.rb
      40 ./app/helpers/static_pages_helper.rb
      39 ./config/environments/test.rb
      33 ./spec/controllers/events_controller_spec.rb
      32 ./spec/factories/users.rb
      28 ./config/application.rb
      27 ./app/controllers/socialization_controller.rb
      26 ./spec/controllers/static_pages_controller_spec.rb
      23 ./db/migrate/20141021173344_create_activities.rb
      22 ./db/seeds.rb
      22 ./config/unicorn.rb
      18 ./spec/mailers/user_mailer_spec.rb
      18 ./spec/features/contact_email_sending_spec.rb
      17 ./spec/helpers/omniauth_callbacks_helper_spec.rb
      17 ./db/migrate/20140928183141_create_events.rb
      16 ./spec/support/controller_macros.rb
      16 ./config/initializers/inflections.rb
      16 ./app/helpers/application_helper.rb
      15 ./spec/helpers/users_helper_spec.rb
      15 ./spec/helpers/static_pages_helper_spec.rb
      15 ./spec/helpers/socialization_helper_spec.rb
      15 ./spec/helpers/registrations_helper_spec.rb
      15 ./spec/helpers/events_helper_spec.rb
      15 ./spec/helpers/categories_helper_spec.rb
      15 ./spec/helpers/activities_helper_spec.rb
      15 ./app/mailers/user_mailer.rb
      14 ./db/migrate/20141017172704_create_mentions.rb
      14 ./db/migrate/20141017172703_create_likes.rb
      14 ./db/migrate/20141017172702_create_follows.rb
      14 ./config/initializers/wrap_parameters.rb
      14 ./app/controllers/omniauth_callbacks_controller.rb
      12 ./spec/controllers/categories_controller_spec.rb
      12 ./spec/controllers/activities_controller_spec.rb
      12 ./db/migrate/20141008221010_edit_events.rb
      12 ./app/controllers/registrations_controller.rb
      11 ./db/migrate/20141020213745_add_attachment_avatar_to_users.rb
      10 ./test/test_helper.rb
      10 ./db/migrate/20141002204736_create_categorizations.rb
      9 ./db/migrate/20141002204541_create_categories.rb
      9 ./config/initializers/assets.rb
      9 ./app/controllers/application_controller.rb
      8 ./db/migrate/20140930025913_add_fields_to_users.rb
      7 ./db/migrate/20141001022017_add_lat_and_long_to_user.rb
      7 ./db/migrate/20140928232127_remove_type_from_tables.rb
      7 ./config/initializers/backtrace_silencers.rb
      6 ./db/migrate/20141017165211_add_columns_to_users.rb
      6 ./db/migrate/20141013192052_fix_categories.rb
      6 ./db/migrate/20141008225504_change_event_image.rb
      6 ./app/models/event.rb
      5 ./spec/views/venues/show.html.erb_spec.rb
      5 ./spec/views/venues/new.html.erb_spec.rb
      5 ./spec/views/venues/index.html.erb_spec.rb
      5 ./spec/views/venues/edit.html.erb_spec.rb
      5 ./spec/views/users/user_events.html.erb_spec.rb
      5 ./spec/views/users/show.html.erb_spec.rb
      5 ./spec/views/users/profile.html.erb_spec.rb
      5 ./spec/views/users/index.html.erb_spec.rb
      5 ./spec/views/static_pages/home.html.erb_spec.rb
      5 ./spec/views/static_pages/contact.html.erb_spec.rb
      5 ./spec/views/static_pages/about.html.erb_spec.rb
      5 ./spec/views/interests/show.html.erb_spec.rb
      5 ./spec/views/interests/new.html.erb_spec.rb
      5 ./spec/views/interests/index.html.erb_spec.rb
      5 ./spec/views/interests/edit.html.erb_spec.rb
      5 ./spec/views/events/show.html.erb_spec.rb
      5 ./spec/views/events/new.html.erb_spec.rb
      5 ./spec/views/events/index.html.erb_spec.rb
      5 ./spec/views/events/edit.html.erb_spec.rb
      5 ./spec/views/categories/update_eventful_categories.html.erb_spec.rb
      5 ./spec/views/acts/show.html.erb_spec.rb
      5 ./spec/views/acts/new.html.erb_spec.rb
      5 ./spec/views/acts/index.html.erb_spec.rb
      5 ./spec/views/acts/edit.html.erb_spec.rb
      5 ./spec/views/activities/index.html.erb_spec.rb
      5 ./spec/models/user_spec.rb
      5 ./spec/models/event_spec.rb
      5 ./spec/models/category_spec.rb
      5 ./spec/models/categorization_spec.rb
      5 ./spec/controllers/socialization_controller_spec.rb
      5 ./spec/controllers/registrations_controller_spec.rb
      5 ./spec/controllers/omniauth_callbacks_controller_spec.rb
      5 ./db/migrate/20141016150129_add_category_classes.rb
      5 ./db/migrate/20141014031708_add_admin_to_users.rb
      5 ./db/migrate/20141013171505_add_category_id.rb
      5 ./db/migrate/20141009222705_add_eventful_id_to_events.rb
      5 ./db/migrate/20141009014530_add_user_to_events.rb
      5 ./config/environment.rb
      5 ./app/controllers/activities_controller.rb
      4 ./config/initializers/mime_types.rb
      4 ./config/initializers/filter_parameter_logging.rb
      4 ./config/boot.rb
      4 ./app/models/category.rb
      4 ./app/models/categorization.rb
      3 ./config/initializers/session_store.rb
      2 ./config/initializers/cookies_serializer.rb
      2 ./app/models/mention.rb
      2 ./app/models/like.rb
      2 ./app/models/follow.rb
      2 ./app/helpers/users_helper.rb
      2 ./app/helpers/socialization_helper.rb
      2 ./app/helpers/registrations_helper.rb
      2 ./app/helpers/omniauth_callbacks_helper.rb
      2 ./app/helpers/events_helper.rb
      2 ./app/helpers/categories_helper.rb
      2 ./app/helpers/activities_helper.rb)
    

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
    @lat = params['latitude']
    @long = params['longitude']
    session[:current_location] = "#{@lat},#{@long}"
    session[:current_lat] = @lat
    session[:current_long] = @long
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

  def make_map(eventz) 
    begin
      if eventz != false
        @hash = Gmaps4rails.build_markers(eventz) do |event, marker|
          marker.lat event['latitude']
          marker.lng event['longitude']
          marker.title event['title']
          marker.infowindow "<h6><a style=padding: 1.25em; href=#{event['url']}>Event Link</a><br>Title: #{event['title']}<br>Venue: #{event['venue_name']}</h6>"
        end 
      end
    rescue
      @hash = nil
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
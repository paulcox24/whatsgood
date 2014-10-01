module Apis
	module Eventful
    require 'eventful/api'
        def get_eventful_search_data
      eventful = Eventful::API.new ENV['EVENTFUL_API_KEY']

      @results = eventful.call 'events/search',
                           :location => "Salt Lake",
                           :page_size => 5
    end

    def get_title()
      get_eventful_search_data
      @results['events']['event'].first do |event|
        event['title']
      end
    end

  end
end
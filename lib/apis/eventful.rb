module Apis
	module Eventful
    eventful = Eventful::API.new ENV['EVENTFUL_API_KEY']
    def get_eventful_search_data
      @results = eventful.call 'events/search',
                           :location => "Salt Lake",
                           :page_size => 5
    end

    def get_title()
      @results['events']['event'].each do |event|
        event['title']
      end
    end

  end
end
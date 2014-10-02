module StaticPagesHelper

  def get_eventful(latitude, longitude=nil)
    eventful = Eventful::API.new ENV["EVENTFUL_API_KEY"]
    result = eventful.call 'events/search', :category => 'music', :location => "#{latitude},#{longitude}", :within => 5, :date => 'Future', :image_sizes => 'large'
    @events = result['events']['event']
  end
  
end

module StaticPagesHelper
  def category_class(event)
  	e = event
  	category = ""
  	e['categories']['category'].each do |i|
      i.each do |j,k|
        category = event['categories']['category']['id'] if !k 
        category = "#{category} #{k} " if j == "id" 
      end 
    end 
  return category
  end

  def event_favoritors(eventful)
    events = Event.where(eventful_id: eventful)
    event_favoritors_ids = events.map {|event| event.user_id }
    @event_favoritors = User.find(event_favoritors_ids)
  end  

  def event_favoritors_count(eventful)
    events = Event.where(eventful_id: eventful)
    events.count
  end    
end

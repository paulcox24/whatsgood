class Act < ActiveRecord::Base
has_many :venue_acts
has_many :event_acts
has_many :events, through: :event_acts
has_many :venues, through: :venue_acts
end

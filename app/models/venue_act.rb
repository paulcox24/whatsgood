class VenueAct < ActiveRecord::Base
  belongs_to :venue
  belongs_to :act
end

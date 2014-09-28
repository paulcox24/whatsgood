class Venue < ActiveRecord::Base
  has_many :events
  has_many :venue_acts
  has_many :acts, through: :venue_acts
end

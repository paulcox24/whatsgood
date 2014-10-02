class Venue < ActiveRecord::Base
  has_many :events
  has_many :venue_acts
  has_many :acts, through: :venue_acts
  # adding geocoder stuff ##
  geocoded_by :location   # can also be an IP address
  after_validation :geocode, :if => :location_changed?         # auto-fetch coordinates

  reverse_geocoded_by :latitude, :longitude
  after_validation :reverse_geocode  # auto-fetch address
end

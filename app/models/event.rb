class Event < ActiveRecord::Base
  belongs_to :user
  has_many :acts, through: :event_acts
  has_many :event_acts
end

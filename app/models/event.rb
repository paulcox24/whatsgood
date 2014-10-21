class Event < ActiveRecord::Base
  include PublicActivity::Common
  # tracked owner: ->(controller, model) {controller && controller.current_user}

  belongs_to :user
  has_many :acts, through: :event_acts
  has_many :event_acts
end

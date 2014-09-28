class EventAct < ActiveRecord::Base
  belongs_to :event
  belongs_to :act
end

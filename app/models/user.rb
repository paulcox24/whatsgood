class User < ActiveRecord::Base
  has_many :categorizations
  has_many :categories, through: :categorizations
  has_many :events
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  geocoded_by :address   # can also be an IP address
  after_validation :geocode, :if => :address_changed?         # auto-fetch coordinates

  reverse_geocoded_by :latitude, :longitude
  after_validation :reverse_geocode  # auto-fetch address

end

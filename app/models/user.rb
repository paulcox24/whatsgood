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

  acts_as_follower
  acts_as_followable

  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/icon-user-default.png"
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
  validates_attachment_size :avatar, :less_than => 5.megabytes

  def can_edit_user?(user)
    self == user || self.is_admin
  end  
end

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  attr_accessible :address, :email, :name, :onCampus, :phone, :provider, :text

  has_many :ride_requests, :class_name => "RideRequest", :dependent => :destroy   #delete a user's ride requests if they delete their account

  validates :name, :presence => true
  validates :email, :presence => true,
            :uniqueness => { :case_sensitive => false },
            :format => { :with => /\A([a-z]|\d)+@([a-z]+.|)wm.edu\z/i, :message => "Must be a William and Mary email address" }
  validates :password, :confirmation => true
  validates :password_confirmation, :presence => true
  validates :address, :presence => true
  validates :phone, :presence => true, :format => { :with => /^(1-|1)?\(?([0-9]{3})\)?[-. ]?([0-9]{3})[-. ]?([0-9]{4})$/, :message => "is invalid" } #got this regex online

  public

  def currentRideRequest
    self.ride_requests.where(['state <> ? AND state <> ?', 'Dropped Off', 'Canceled'])[0]
  end

end

class Worker < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, #:registerable, need to ensure AA can still create, and worker themself can modify
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  attr_accessible :email, :name, :phone

  validates :name,  :presence => true
  validates :email, :presence => true,
            :uniqueness => { :case_sensitive => false },
            :format => { :with => /\A([a-z]|\d)+@([a-z]+.|)wm.edu\z/i, :message => "Must be a William and Mary email address" }
  validates :phone, :presence => true, :format => { :with => /^(?:(?:\+?1\s*(?:[.-]\s*)?)?(?:\(\s*([2-9]1[02-9]|[2-9][02-8]1|[2-9][02-8][02-9])\s*\)|([2-9]1[02-9]|[2-9][02-8]1|[2-9][02-8][02-9]))\s*(?:[.-]\s*)?)?([2-9]1[02-9]|[2-9][02-9]1|[2-9][02-9]{2})\s*(?:[.-]\s*)?([0-9]{4})(?:\s*(?:#|x\.?|ext\.?|extension)\s*(\d+))?$/, :message => "Invalid phone number" } #got this regex online

end

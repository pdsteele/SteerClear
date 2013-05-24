class Building < ActiveRecord::Base
  attr_accessible :name, :longitude, :latitude

  validates :name, :presence => true, :uniqueness => { :case_sensitive => false }
  #uncomment these once coordinates are added
  #validates :longitude, :presence => true
  #validates :latitude, :presence => true

  default_scope order('name ASC')
end

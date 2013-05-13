class Building < ActiveRecord::Base
  attr_accessible :name

  validates :name, :presence => true, :uniqueness => { :case_sensitive => false }

  default_scope order('name ASC')
end

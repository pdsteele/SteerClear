class Shift < ActiveRecord::Base

  attr_accessible :inService, :navigator_id, :driver_id

  belongs_to :driver, :class_name => "Worker", foreign_key: "driver_id"
  belongs_to :navigator, :class_name => "Worker", foreign_key: "navigator_id"

  before_create :set_default

  validates :driver_id, presence: true
  validates :navigator_id, presence: true

  private
    def set_default
      #shift is not inservice upon creation - worker must press button
      if self.inService.nil?
        self.inService = false
      end
    end

end

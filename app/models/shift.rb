class Shift < ActiveRecord::Base

  attr_accessible :inService, :navigator_id, :driver_id, :shiftActive, :shiftEndTime

  belongs_to :driver, :class_name => "Worker", foreign_key: "driver_id"
  belongs_to :navigator, :class_name => "Worker", foreign_key: "navigator_id"

  before_create :set_defaults

  validates :driver_id, presence: true
  validates :navigator_id, presence: true
  validate :shiftActive, presence: true

  private
    def set_defaults
      #shift is not inservice upon creation - worker must press button
      if self.inService.nil?
        self.inService = false
      end

      if self.shiftActive.nil?
        self.shiftActive = true
      end

    end

end

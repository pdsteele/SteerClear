class Shift < ActiveRecord::Base

  attr_accessible :inService, :navigator_id, :driver_id, :shiftActive, :shiftEndTime, :shiftActiveLength
  #SHIFT ACTIVE LENGTH REFERS TO TIME INSERVICE IS TRUE - NEEDS TO BE REFACTORED

  belongs_to :driver, :class_name => "Worker", foreign_key: "driver_id"
  belongs_to :navigator, :class_name => "Worker", foreign_key: "navigator_id"

  before_create :set_defaults

  validates :driver_id, presence: true
  validates :navigator_id, presence: true
  validate :shiftActive, presence: true

  public

    def self.anyActiveShifts?
        !Shift.where("inService = ?", true)[0].nil?
    end

    def shiftLength #returns human readable string of time that shift has taken
      if self.shiftEndTime.nil?
        temp = Time.now - self.created_at
      else
        temp = self.shiftEndTime - self.created_at
      end

      hours = (temp/3600).to_i
      minutes = (temp/60 - hours * 60).to_i

      if hours == 0
        minutes.to_s + " minutes"
      else
        hours.to_s + " hours " + minutes.to_s + " minutes"
      end
    end

    def activeLength #returns human readable string of length of time it accepted rides
      if self.inService == true
        temp = (Time.now - self.updated_at) + self.shiftActiveLength
      else
        temp = self.shiftActiveLength
      end

      hours = (temp/3600).to_i
      minutes = (temp/60 - hours * 60).to_i

      if hours == 0
        minutes.to_s + " minutes"
      else
        hours.to_s + " hours " + minutes.to_s + " minutes"
      end
    end


  private
    def set_defaults
      #shift is not inservice upon creation - worker must press button
      if self.inService.nil?
        self.inService = false
      end

      if self.shiftActive.nil?
        self.shiftActive = true
      end

      if self.shiftActiveLength.nil?
        self.shiftActiveLength = 0
      end

    end

end

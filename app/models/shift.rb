class Shift < ActiveRecord::Base

  attr_accessible :inService, :navigator_id, :driver_id, :shiftActive, :shiftEndTime, :shiftActiveLength, :location, :comment, :longitude, :latitude, :onCampus, :capacity
  #SHIFT ACTIVE LENGTH REFERS TO TIME INSERVICE IS TRUE - NEEDS TO BE REFACTORED

  belongs_to :driver, :class_name => "Worker", foreign_key: "driver_id"
  belongs_to :navigator, :class_name => "Worker", foreign_key: "navigator_id"
  has_many :ride_requests

  geocoded_by :location
  before_validation :checkLocation
  after_validation :geocode          # auto-fetch coordinates

  before_create :set_defaults

  validates :location, presence: true
  validates :driver_id, presence: true
  validates :navigator_id, presence: true
  validates :shiftActive, presence: true
  validates :capacity, presence: true

  public

    def self.activeShifts
        Shift.where("inService = ?", true)
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

      if self.capacity.nil?
        self.capacity = 8
      end

    end

    def checkLocation
      #ensures location is within radius of william and mary
      tempCoords = Geocoder.coordinates(self.location)

      if Geocoder::Calculations.distance_between(tempCoords, [37.2678843, -76.71794369999999]) > 2.5 #two and half mile radius for valid addresses
        self.location = nil #should force rejection from database since it validates location
      else
        #check addressbookentries and buildings to see if it already exists in the database and grab their coordinates


        #geocode unknown coordinates and remove after_validation geocoding
      end
    end

end

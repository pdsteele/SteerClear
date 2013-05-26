class RideRequest < ActiveRecord::Base
  attr_accessible :destAddress, :destLat, :destLong, :destOnCampus, :dropOffTime, :name, :partySize, :phone, :pickUpTime,
                  :pickupAddress, :pickupLat, :pickupLong, :pickupOnCampus, :shift_id, :state, :text, :user_id, :waitTime

  belongs_to :user
  belongs_to :shift
  has_one :navigator, through: :shift # :class_name => "Worker", foreign_key: "navigator_id"
  has_one :driver, through: :shift #, :class_name => "Worker", foreign_key: "driver_id"

  before_validation :set_defaults
  #after_validation :fetchCoords

  validates :name, :presence => true
  validates :phone, :presence => true,
            :format => { :with => /^(?:(?:\+?1\s*(?:[.-]\s*)?)?(?:\(\s*([2-9]1[02-9]|[2-9][02-8]1|[2-9][02-8][02-9])\s*\)|([2-9]1[02-9]|[2-9][02-8]1|[2-9][02-8][02-9]))\s*(?:[.-]\s*)?)?([2-9]1[02-9]|[2-9][02-9]1|[2-9][02-9]{2})\s*(?:[.-]\s*)?([0-9]{4})(?:\s*(?:#|x\.?|ext\.?|extension)\s*(\d+))?$/, :message => "Invalid phone number" } #got this regex online
  validates :text, :presence => true
  validates :state, :presence => true
  #states can be open, on the way, picked up, dropped off, or canceled (only use if worker has to reject it, auto send text with reason)
  validates :partySize, :presence => true, :format => { :with => /\A[1-8]\z/, :message => "Invalid Party Size (Requests can have 1-8 people in the party)" }
  validates :destAddress, :presence => true
  validates :destOnCampus, :presence => true
  validates :destLat, :presence => true
  validates :destLong, :presence => true
  validates :pickupAddress, :presence => true
  validates :pickupOnCampus, :presence => true
  validates :pickupLat, :presence => true
  validates :pickupLong, :presence => true
  validates :user_id, :presence => true
  #do not validate shift_id, not needed if state is not open

  ##########################PUBLIC METHODS #########################################################
  public

  def fetchPickupCoords  #called upon creation and if updated
    #check if entry from address book or buildings - add once both are implemented with gps coordinates

    #otherwise, grab their coordinates, check if they're within range, and store them
    pickupTempCoords = Geocoder.coordinates(self.pickupAddress)
    if (Geocoder::Calculations.distance_between(pickupTempCoords, [37.2678843, -76.71794369999999]) > 2.5)
      self.pickupAddress = nil
      flash[:error] = "Your pickup location is out of Steer Clear's operating range :("
    else
      self.pickupLat = pickupTempCoords[0]
      self.pickupLong = pickupTempCoords[1]
    end #end if
  end

  def fetchDestCoords
    #check if entry from address book or buildings - add once both are implemented with gps coordinates

    destTempCoords = Geocoder.coordinates(self.destAddress)

    if (Geocoder::Calculations.distance_between(destTempCoords, [37.2678843, -76.71794369999999]) > 2.5)
      self.destAddress = nil
      flash[:error] = "Your destination is out of Steer Clear's operating range :("
    else
      self.destLat = destTempCoords[0]
      self.destLong = destTempCoords[1]
    end #end if

  end

  #######################PRIVATES ###################################################
  private

  def set_defaults
    #set defaults for non-provided variables
    if self.state.nil?
      self.state = "Open" #states can be open, on the way, picked up, dropped off, or canceled (only use if worker has to reject it, auto send text with reason)
    end

    #set coordinates for new record
    if self.pickupLat.nil? and self.pickupLong.nil?
      self.fetchPickupCoords
    end

    if self.destLat.nil? and self.destLong.nil?
      self.fetchDestCoords
    end


  end





end

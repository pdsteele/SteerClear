class WorkersController < ApplicationController
  before_filter :authenticate_worker!

  def show
    @rideRequest = RideRequest.new
  end #end show

end

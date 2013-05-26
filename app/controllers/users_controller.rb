class UsersController < ApplicationController
  before_filter :authenticate_user!

  def show
    @user = current_user

    @rideRequest = @user.currentRideRequest
    if @rideRequest.nil? and Shift.activeShifts.count != 0
      @rideRequest = @user.ride_requests.build(user_id: @user.id, name: @user.name, phone: @user.phone, text: @user.text)
    end
  end

end

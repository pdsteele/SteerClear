class RideRequestsController < ApplicationController

  def create
    @rideRequest = RideRequest.new(params[:ride_request])
    correctPath = rolePath

    #@rideRequest.fetchDestCoords
    #@rideRequest.fetchPickupCoords
    #@rideRequest.state = "Open"

    #deny if no vans are accepting ride requests
    if (Shift.activeShifts.count > 0)
      if @rideRequest.save
        respond_to do |format|
          format.js
          format.html { redirect_to correctPath }
        end
      else
        #deny due to database rejection, errors should appear in form
        respond_to do |format|
          flash[:error] = "Error has occured, please try again"
          format.js { render :js => "window.location.href = '#{correctPath}'" }
          format.html { redirect_to correctPath }
        end
      end
    else
      flash[:error] = "No vans are currently operating. Please check our schedule on the about page."
      respond_to do |format|
        format.js { render :js => "window.location.href = '#{correctPath}'" }
        format.html { redirect_to correctPath }
      end
    end

  end

  def show
    @rideRequest = RideRequest.find(params[:id])
  end

  def update
    #use for address changes and party size changes

    #if ride is on the way, check if party size violates capacity - if so, reject the update and display an error

  end

  def stateChange
    #use when workers change states - needs different js file to properly modify worker dashboard elements

  end

  def destroy
    @rideRequest = RideRequest.find(params[:ride_request][:id])

    if @rideRequest.destroy
      flash[:success] = "The Ride Request has been deleted"
    else
      flash[:error] = "Request deletion failed :( Please try again"
    end

    redirect_to rolePath
  end

end


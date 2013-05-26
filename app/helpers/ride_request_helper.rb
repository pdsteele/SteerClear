module RideRequestHelper

  def requestPath(rideRequest)
    if rideRequest.state.nil?
      createRequest_path
    else
      updateRequest_path
    end
  end

end

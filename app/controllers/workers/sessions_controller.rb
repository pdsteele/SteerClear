class Workers::SessionsController < Devise::SessionsController
  #overriden to ensure that worker logs out as a user if they are already logged in

  def new
    if user_signed_in?
      flash[:error] = "WARNING: You are currently signed in as a user. If you sign on as a Steer Clear worker, your user account will be logged out!"
    end
    super
  end

  def create
    if user_signed_in?
      sign_out current_user
      flash[:error] = "WARNING: Your user account was logged out upon logging in as a worker"
      #redirect_to "/workers/sign_in" # Force a full reload
    end
    super
  end

end

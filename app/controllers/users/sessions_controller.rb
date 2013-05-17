class Users::SessionsController < Devise::SessionsController
  #overriden to ensure that worker logs out as a user if they are already logged in

  def new
    if worker_signed_in?
      flash[:error] = "WARNING: You are currently signed in as a Steer Clear worker. If you sign on as a user, any shifts will be ended, and accepted rides will be re-queued!"
    end
    super
  end

  def create
    if worker_signed_in?
      sign_out current_worker
      flash[:error] = "WARNING: Your worker account was logged out upon logging in as a user. Any accepted rides were re-queued."
      #redirect_to "/workers/sign_in" # Force a full reload
    end
    super
  end

end
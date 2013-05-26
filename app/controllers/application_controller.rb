class ApplicationController < ActionController::Base
  protect_from_forgery

  def rolePath
    #returns the path for the appropriate type of user
    if user_signed_in?
      users_path
    elsif worker_signed_in?
      workers_path
    else
      new_user_session_path
    end
  end

end

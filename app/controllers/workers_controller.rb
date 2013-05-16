class WorkersController < ApplicationController

  def show
    redirect_to "/workers/sign_in" if !worker_signed_in? #redirects non-logged in workers to log in page
    #@worker = Worker.find(current_worker.id)
  end
end

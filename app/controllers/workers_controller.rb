class WorkersController < ApplicationController

  def show
    if !worker_signed_in?
      redirect_to "/workers/sign_in"#redirects non-logged in workers to log in page

    else

      @worker = Worker.find(current_worker.id)

      #if no shift is started, generate a new shift object
      if (!@worker.activeShift?)
        @shift = @worker.navShifts.new
      end

      respond_to do |format|
        format.js
        format.html { render "show" }
      end

    end #end top if

  end #end show
end

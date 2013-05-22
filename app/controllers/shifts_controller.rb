class ShiftsController < ApplicationController
  before_filter :authenticate_worker!

  def create
    @shift = Shift.new(params[:shift])
    @shift.shiftActive = true  #SHIFT ACTIVE INDICATES THAT IT IS STARTED
    @shift.inService = false #SHIFT IN SERVICE INDICATES THAT IT IS ACCEPTING RIDES
    @shift.shiftActiveLength = 0.00

    @driver = Worker.find(params[:shift][:driver_id])
    @navigator = Worker.find(params[:shift][:navigator_id])

    if @driver.id == @navigator.id
      flash[:error] = "Driver cannot be the navigator" #doesn't display with js
      render "workers/show" #doesn't happen with js
    else
      @driver.activeShift = true
      @navigator.activeShift = true

      if @shift.save and @driver.save and @navigator.save
        #flash[:success] = "Your shift has begun!"
        respond_to do |format|
          format.js
          format.html { redirect_to workers_path }
        end
      else
        flash[:error] = "Shift could not be started. Make sure you selected both a driver and a navigator"
        redirect_to "workers/show"
      end
    end
  end

  def makeInService
    @shift = current_worker.currentShift

    if @shift.update_attributes(params[:shift])
      respond_to do |format|
        format.js
        format.html { redirect_to workers_path }
      end
    end
  end

  def makeOffService
    @shift = current_worker.currentShift

    @shift.inService = params[:shift][:inService]
    @shift.shiftActiveLength = @shift.shiftActiveLength + (Time.now - @shift.updated_at)

    if @shift.save
      respond_to do |format|
        format.js
        format.html { redirect_to workers_path }
      end
    end
  end

  def endShift
    @shift = current_worker.currentShift
    @driver = @shift.driver
    @navigator = @shift.navigator

    @driver.activeShift = false
    @navigator.activeShift = false

    @shift.shiftEndTime = Time.now


    if @driver.save and @navigator.save and @shift.update_attributes(params[:shift])
      respond_to do |format|
        format.js
        format.html { redirect_to workers_path }
      end
    end

  end

end

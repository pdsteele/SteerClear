class ShiftsController < ApplicationController
  before_filter :authenticate_worker!

  def create
    #REFACTOR THIS AND BUILD MORE OF IT INTO SHIFT MODEL EVENTUALLY

    #catch if worker input identical nav/driver or didn't fill either in
    if (params[:shift][:driver_id] == params[:shift][:navigator_id] || params[:shift][:driver_id] == "" || params[:shift][:navigator_id] == "")
      flash[:error] = "The driver and navigator must exist and be unique workers"
      respond_to do |format|
        format.js { render :js => "window.location.href = '#{workers_path}'" }
        format.html { redirect_to workers_path }
      end

    else
      @driver = Worker.find(params[:shift][:driver_id])
      @navigator = Worker.find(params[:shift][:navigator_id])

      @shift = Shift.new(params[:shift])
      @shift.shiftActive = true  #SHIFT ACTIVE INDICATES THAT IT IS STARTED
      @shift.inService = false #SHIFT IN SERVICE INDICATES THAT IT IS ACCEPTING RIDES
      @shift.shiftActiveLength = 0.00
      @shift.location = "Police and Parking Services 23185"
      @shift.onCampus = true
      @shift.capacity = 8

      @driver.activeShift = true
      @navigator.activeShift = true

      if @shift.save and @driver.save and @navigator.save
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

  def updateAddress
    @shift = current_worker.currentShift

    #if params[:shift][:address1] == ""

    if @shift.update_attributes(params[:shift])
      respond_to do |format|
        format.js
        format.html { redirect_to workers_path }
      end
    else
      flash[:error] = "Please enter a valid address within 7 miles of W&M. Also, please try omitting the city/state/zip-code."
      respond_to do |format|
        format.js { render :js => "window.location.href = '#{workers_path}'" }
        format.html { redirect_to workers_path }
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

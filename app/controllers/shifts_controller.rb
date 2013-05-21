class ShiftsController < ApplicationController

  def create
    @shift = Shift.new(params[:shift])
    @shift.shiftActive = true
    @shift.inService = false

    @driver = Worker.find(params[:shift][:driver_id])
    @navigator = Worker.find(params[:shift][:navigator_id])

    if @driver.id == @navigator.id
      flash[:error] = "Driver cannot be the navigator"
      redirect_to "workers/show"
    end


    @driver.activeShift = true
    @navigator.activeShift = true

    if @shift.save and @driver.save and @navigator.save
      #flash[:success] = "Your shift has begun!"
      respond_to do |format|
        format.js

      end
    else
      flash[:error] = "Shift could not be started. Make sure you selected both a driver and a navigator"
      redirect_to "workers/show"
    end


  end

  def makeInService
    @shift = Shift.find(params[:id])
    @shift.inService = true

    if @shift.save
      respond_to do |format|
        format.js
      end
    end
  end

  def makeOffService
    @shift = Shift.find(params[:id])
    @shift.inService = false

    if @shift.save
      respond_to do |format|
        format.js
      end
    end
  end

  def endShift
    @shift = Shift.find(params[:id])
    @driver = Worker.find(params[:shift][:driver_id])
    @navigator = Worker.find(params[:shift][:navigator_id])

    @driver.activeShift = false
    @navigator.activeShift = false

    @shift.shiftActive = false


    if @driver.save and @navigator.save and @shift.save
      respond_to do |format|
        format.js
      end
    end

  end

end

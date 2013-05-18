class ShiftsController < ApplicationController

  #def new
  #  @shift = Shift.new
  #end

  def create
    @shift = Shift.new(params[:shift])
    @shift.inService = true

    @driver = Worker.find(params[:shift][:driver_id])
    @navigator = Worker.find(params[:shift][:navigator_id])

    if @driver.id == @navigator.id
      flash[:error] = "Driver cannot be the navigator"
      redirect_to "workers/show"
    end

    #UNCOMMENT WHEN DONE TESTING
    #@driver.activeShift = true
    #@navigator.activeShift = true

    if @shift.save #and @driver.save and @navigator.save
      flash[:success] = "Your shift has begun!"
      respond_to do |format|
        format.js

      end
    else
      flash[:error] = "Shift could not be started. Make sure you selected both a driver and a navigator"
      redirect_to "workers/show"
    end


  end

  def destroy
    @shift = Shift.find(params[:id])
    @driver = Worker.find(params[:shift][:driver_id])
    @navigator = Worker.find(params[:shift][:navigator_id])

    @driver.activeShift = false
    @navigator.activeShift = false


    @driver.save
    @navigator.save

    @shift.destroy #change to @shift.inServer = false and @shift.save

  end

end

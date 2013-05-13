class BuildingController < ApplicationController

  def new
    @building = Buildings.new
  end

  def create
    @building = Buildings.build(params[:building])
    if @building.save
      puts("Building successfully added")
      flash[:success] = "Building successfully added"
    else
      #figure out a way to discriminate between error types?
      puts("Building creation failed. Check for duplicity.")
      #flash[:failure] = "Is this a duplicate building?"
      # render :action => 'new'
    end
  end

end

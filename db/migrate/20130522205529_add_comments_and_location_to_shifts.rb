class AddCommentsAndLocationToShifts < ActiveRecord::Migration
  def change
    add_column :shifts, :location, :string
    add_column :shifts, :comment, :string
    add_column :shifts, :latitude, :float
    add_column :shifts, :longitude, :float
  end
end

class AddActiveLengthToShifts < ActiveRecord::Migration
  def change
    add_column :shifts, :shiftActiveLength, :float
  end
end

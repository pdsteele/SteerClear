class AddOnCampusToShifts < ActiveRecord::Migration
  def change
    add_column :shifts, :onCampus, :boolean
  end
end

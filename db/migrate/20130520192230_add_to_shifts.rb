class AddToShifts < ActiveRecord::Migration
  def up
    add_column :shifts, :shiftActive, :boolean
    add_column :shifts, :shiftEndTime, :datetime
    #change_table(:shifts) do |t|
    #  t.boolean :shiftActive
    #  t.datetime :shiftEndTime
    #end
  end

  def down
  end
end

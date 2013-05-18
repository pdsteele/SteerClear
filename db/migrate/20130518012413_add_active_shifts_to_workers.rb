class AddActiveShiftsToWorkers < ActiveRecord::Migration
  def change
    add_column :workers, :activeShift, :boolean
  end
end

class CreateShifts < ActiveRecord::Migration
  def change
    create_table :shifts do |t|
      t.boolean :inService
      t.integer :driver_id
      t.integer :navigator_id
      t.timestamps
    end
    add_index :shifts, :driver_id
    add_index :shifts, :navigator_id
    add_index :shifts, [:driver_id, :navigator_id]
  end
end

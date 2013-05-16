class CreateWorkers < ActiveRecord::Migration
  def change
    create_table :workers do |t|
      t.string :name
      t.string :email,              :null => false, :default => ""
      t.string :phone

      t.timestamps
    end
  end
end

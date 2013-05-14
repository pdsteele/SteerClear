class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :email, :null => false, :default => ""
      t.string :phone
      t.boolean :text
      t.string :provider
      t.boolean :onCampus
      t.string :address

      t.timestamps
    end
  end
end

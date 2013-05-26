class CreateRideRequests < ActiveRecord::Migration
  def change
    create_table :ride_requests do |t|
      t.string :name
      t.string :phone
      t.boolean :text
      t.integer :shift_id
      t.string :state
      t.integer :partySize
      t.datetime :pickUpTime
      t.datetime :dropOffTime
      t.float :waitTime
      t.string :pickupAddress
      t.boolean :pickupOnCampus
      t.float :pickupLong
      t.float :pickupLat
      t.string :destAddress
      t.boolean :destOnCampus
      t.float :destLong
      t.float :destLat
      t.integer :user_id

      t.timestamps
    end
  end
end

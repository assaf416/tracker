class CreatePassengers < ActiveRecord::Migration[8.0]
  def change
    create_table :passengers do |t|
      t.integer :ride_id
      t.string :name
      t.string :image_url
      t.integer :rating
      t.integer :driver_id
      t.integer :fleet_id
      t.integer :device_id
      t.integer :user_id
      t.integer :status

      t.timestamps
    end
    add_index :passengers, :ride_id
    add_index :passengers, :fleet_id
    add_index :passengers, :driver_id
    add_index :passengers, :user_id
    add_index :passengers, :device_id
    add_index :passengers, :status
  end
end

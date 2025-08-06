class CreateActivities < ActiveRecord::Migration[8.0]
  def change
    create_table :activities do |t|
      t.integer :user_id
      t.integer :driver_id
      t.integer :ride_id
      t.integer :fleet_id
      t.integer :device_id
      t.integer :package_id
      t.integer :passenger_id
      t.string :level
      t.string :kind
      t.text :message
      t.text :settings
      t.string :location
      t.string :speed
      t.string :heading
      t.string :status
      t.string :lat
      t.string :longt

      t.timestamps
    end
    add_index :activities, :user_id
    add_index :activities, :passenger_id
    add_index :activities, :kind
    add_index :activities, :fleet_id
    add_index :activities, :driver_id
    add_index :activities, :ride_id
    add_index :activities, :device_id
    add_index :activities, :level
    add_index :activities, :status
    add_index :activities, :package_id
  end
end

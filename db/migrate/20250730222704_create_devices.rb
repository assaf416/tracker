class CreateDevices < ActiveRecord::Migration[8.0]
  def change
    create_table :devices do |t|
      t.string :kind
      t.integer :user_id
      t.integer :fleet_id
      t.integer :device_kind_id
      t.string :name
      t.text :settings
      t.string :type
      t.string :model
      t.integer :driver_id
      t.string :last_location
      t.datetime :last_location_at
      t.text :recent_message
      t.text :system_message
      t.integer :error_id
      t.string :avatar
      t.string :ssid
      t.string :speed
      t.string :heading

      t.timestamps
    end
    add_index :devices, :kind
    add_index :devices, :user_id
    add_index :devices, :type
    add_index :devices, :driver_id
    add_index :devices, :error_id
    add_index :devices, :avatar
    add_index :devices, :fleet_id
    add_index :devices, :ssid
    add_index :devices, :device_kind_id
  end
end

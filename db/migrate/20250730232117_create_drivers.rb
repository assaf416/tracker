class CreateDrivers < ActiveRecord::Migration[8.0]
  def change
    create_table :drivers do |t|
      t.string :name
      t.string :image_url
      t.string :status
      t.integer :device_id
      t.integer :fleet_id
      t.datetime :starts_at
      t.text :last_message
      t.string :last_location
      t.datetime :locationed_at
      t.string :speed
      t.string :heading
      t.string :lat
      t.string :longt

      t.timestamps
    end
    add_index :drivers, :device_id
    add_index :drivers, :status
    add_index :drivers, :fleet_id
  end
end

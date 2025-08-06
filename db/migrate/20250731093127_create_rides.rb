class CreateRides < ActiveRecord::Migration[8.0]
  def change
    create_table :rides do |t|
      t.integer :driver_id
      t.integer :customer_id
      t.integer :fleet_id
      t.string :from_location
      t.string :from_address
      t.string :from_lat
      t.string :from_longt
      t.string :to_address
      t.string :to_location
      t.string :to_lat
      t.string :to_longt
      t.float :price
      t.float :tax
      t.datetime :starts_at
      t.datetime :started_at
      t.datetime :completed_at
      t.datetime :accpeted_at
      t.integer :accpeted_by_driver_id
      t.datetime :arrived_to_customer_at
      t.datetime :dropped_at
      t.string :drop_location
      t.string :pickup_location
      t.string :status
      t.text :error_message
      t.text :directions
      t.text :route_points
      t.string :distance

      t.timestamps
    end
    add_index :rides, :driver_id
    add_index :rides, :fleet_id
    add_index :rides, :customer_id
    add_index :rides, :status
    add_index :rides, :accpeted_by_driver_id
  end
end

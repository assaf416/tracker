class CreatePackages < ActiveRecord::Migration[8.0]
  def change
    create_table :packages do |t|
      t.integer :driver_id
      t.integer :ride_id
      t.integer :passenger_id
      t.text :description
      t.text :qr_code
      t.datetime :picked_at
      t.datetime :dropped_at
      t.string :uid

      t.timestamps
    end
    add_index :packages, :driver_id
    add_index :packages, :ride_id
    add_index :packages, :uid
    add_index :packages, :passenger_id
  end
end

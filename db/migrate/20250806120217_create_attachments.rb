class CreateAttachments < ActiveRecord::Migration[8.0]
  def change
    create_table :attachments do |t|
      t.integer :ride_id
      t.integer :fleet_id
      t.integer :device_id
      t.integer :passenger_id
      t.string :name
      t.string :kind
      t.text :content_base_64
      t.integer :driver_id
      t.integer :package_id
      t.integer :ticket_id

      t.timestamps
    end
    add_index :attachments, :ticket_id
    add_index :attachments, :ride_id
    add_index :attachments, :fleet_id
    add_index :attachments, :device_id
    add_index :attachments, :passenger_id
    add_index :attachments, :kind
    add_index :attachments, :driver_id
    add_index :attachments, :package_id
  end
end

class CreateDeviceKinds < ActiveRecord::Migration[8.0]
  def change
    create_table :device_kinds do |t|
      t.integer :device_id
      t.string :kind_id
      t.string :name
      t.string :image_url
      t.string :price
      t.text :descriptio

      t.timestamps
    end
    add_index :device_kinds, :kind_id
  end
end

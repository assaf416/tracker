class CreateLocations < ActiveRecord::Migration[8.0]
  def change
    create_table :locations do |t|
      t.string :kind
      t.string :icon_url
      t.string :name
      t.string :lat
      t.string :longt
      t.integer :fleet_id
      t.string :radius_in_meters
      t.string :category

      t.timestamps
    end
    add_index :locations, :kind
    add_index :locations, :fleet_id
    add_index :locations, :category
  end
end

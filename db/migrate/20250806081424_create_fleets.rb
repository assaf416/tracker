class CreateFleets < ActiveRecord::Migration[8.0]
  def change
    create_table :fleets do |t|
      t.string :name
      t.string :image_url
      t.integer :user_id
      t.text :description

      t.timestamps
    end
    add_index :fleets, :user_id
  end
end

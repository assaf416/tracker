class CreateUsers < ActiveRecord::Migration[8.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :role
      t.string :language
      t.string :phone_no
      t.string :image_url
      t.string :schema

      t.timestamps
    end
    add_index :users, :role
    add_index :users, :phone_no
  end
end

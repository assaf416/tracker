class CreateMessages < ActiveRecord::Migration[8.0]
  def change
    create_table :messages do |t|
      t.integer :driver_id
      t.text :message
      t.integer :to_driver_id

      t.timestamps
    end
    add_index :messages, :driver_id
    add_index :messages, :to_driver_id
  end
end

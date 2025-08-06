class CreateTickets < ActiveRecord::Migration[8.0]
  def change
    create_table :tickets do |t|
      t.integer :driver_id
      t.string :kind
      t.datetime :opened_at
      t.datetime :closed_at
      t.text :description
      t.string :status

      t.timestamps
    end
    add_index :tickets, :driver_id
    add_index :tickets, :kind
    add_index :tickets, :status
  end
end

class CreateTranslations < ActiveRecord::Migration[8.0]
  def change
    create_table :translations do |t|
      t.string :hebrew
      t.string :english

      t.timestamps
    end
    add_index :translations, :hebrew
  end
end

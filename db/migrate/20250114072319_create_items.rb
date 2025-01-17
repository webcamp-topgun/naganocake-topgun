class CreateItems < ActiveRecord::Migration[6.1]
  def change
    create_table :items do |t|

      t.timestamps
      t.integer :genre_id, null: false
      t.string :name, null: false
      t.text :caption, null: false
      t.integer :price, null: false
      t.boolean :is_active, null: false, default: true

    end
  end
end
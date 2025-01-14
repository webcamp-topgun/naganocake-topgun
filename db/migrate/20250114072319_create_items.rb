class CreateItems < ActiveRecord::Migration[6.1]
  def change
    create_table :items do |t|

      t.timestamps
      t.integer :genre_id, null: false, default: ""
      t.string :name, null: false, default: ""
      t.text :caption, null: false, default: ""
      t.integer :price, null: false, default: ""
      t.boolean :is_active, null: false, default: ""
    end
  end
end
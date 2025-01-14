class CreateItems < ActiveRecord::Migration[6.1]
  def change
    create_table :items do |t|

      t.timestamps


      t.string :name, null: false, default: ""
      t.text :caption, null: false, default: ""
      t.integer :price, null: false, default: ""
      t.boolean :is_active, null: false, default: ""
      t.integer :amount, null: false, default: ""

    end
  end
end
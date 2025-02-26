class CreateCartItems < ActiveRecord::Migration[6.1]
  def change
    create_table :cart_items do |t|
      t.timestamps
      t.integer :amount, null: false
      t.integer :customer_id, null: false
      t.integer :item_id, null: false
    end
  end
end

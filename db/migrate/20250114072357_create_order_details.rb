class CreateOrderDetails < ActiveRecord::Migration[6.1]
  def change
    create_table :order_details do |t|
      t.integer :amount, null: false, default: ""
      t.integer :cooking_status, null: false, default: ""
      t.integer :price, null: false, default: ""
      t.timestamps
    end
  end
end

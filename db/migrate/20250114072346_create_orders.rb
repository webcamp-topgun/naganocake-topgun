class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|

      t.timestamps

      t.integer :customer_id, null: false
      t.string :name, null: false
      t.string :postal_code, null: false
      t.string :address, null: false
      t.integer :postage, null: false
      t.integer :payment_method, null: false
      t.integer :total_payment, null: false
      t.integer :status, null: false, default: "0"
    end
  end
end


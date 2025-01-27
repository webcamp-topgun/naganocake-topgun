class OrderDetail < ApplicationRecord
  belongs_to :order
  belongs_to :item

  enum cooking_status: { not_started: 0, pending_production: 1, in_production: 2, production_completed: 3 }


  def subtotal
    price * amount
  end
end

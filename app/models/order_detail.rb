class OrderDetail < ApplicationRecord
  belongs_to :order
  belongs_to :item

  enum cooking_status: { not_started: 0, pending_production: 1, in_production: 2, production_completed: 3 }

  def with_tax_price
    (price * 1.1).floor
  end

  def subtotal
    with_tax_price * amount
  end
end

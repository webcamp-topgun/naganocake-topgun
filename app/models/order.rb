class Order < ApplicationRecord
  belongs_to :customer
  has_many :order_details, dependent: :destroy

  enum payment_method: { credit_card: 0, transfer: 1 }
  enum status: { payment_pending: 0, payment_confirmation: 1, in_production: 2, in_preparation_for_shipping: 3, shipped: 4 }

  def subtotal
    item.with_tax_price * amount
  end

  def status_jp
    I18n.t("enums.order.status.#{status}")
  end

  def full_address
    "〒#{postal_code} #{address} #{name}"
  end
end

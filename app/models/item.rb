class Item < ApplicationRecord
  has_one_attached :image


  has_many :cart_items
  has_many :customers, through: :cart_items

  has_many :order_details, dependent: :destroy
  belongs_to :genre

  def with_tax_price
    (price * 1.1).floor
  end
end

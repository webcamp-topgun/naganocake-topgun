class Item < ApplicationRecord
  has_many :cart_items
  has_many :customers, through: :cart_items

  has_many :order_details, dependent: :destroy
  belongs_to :genre
end

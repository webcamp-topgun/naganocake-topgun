class Customer < ApplicationRecord

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :cart_items
  has_many :items, through: :cart_items

  has_many :addresses, dependent: :destroy
  has_many :orders, dependent: :destroy

  def active_for_authentication?
    super && (is_active == true)
  end
end

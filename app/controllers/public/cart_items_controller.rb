class Public::CartItemsController < ApplicationController
  before_action :authenticate_customer!
  def index
    @cart_items = current_customer.cart_items

  end

  def update
  end

  def destroy
    @cart_items = CartItems.find(params[:id])
    @cart_items.destroy
    redirect_to cart_items_path(current_customer)
  end

  def destroy_all
    @cart_items = current_customer.cart_items
    @cart_items.destroy
    redirect_to cart_items_path(current_customer)
  end

  def create
  end
end

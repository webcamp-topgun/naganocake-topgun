class Public::OrdersController < ApplicationController
  before_action :authenticate_customer!
  def new
    @order = Order.new
  end

  def confirm
    @order = Order.new
    @cart_items = current_customer.cart_items
    
  end

  def complete
  end

  def create
    @order = Order.new
      @order.save
      redirect_to orders_complete_path
  end

  def index
  end

  def show
  end
end

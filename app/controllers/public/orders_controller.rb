class Public::OrdersController < ApplicationController
  before_action :authenticate_customer!
  def new
    @order = Order.new
  end

  def confirm
    @order = Order.new
    @cart_items = current_customer.cart_items
    @order.postage = 800
    @sum = 0
    @total_payment = 0
  end

  def complete
  end

  def create
    @order = Order.new
      @order.save
      redirect_to orders_complete_path
  end

  def index
    @orders = Order.find(params[:id])
  end

  def show
    @order = Order.find(params[:id])
    @order.postage = 800
    @order_details = @order.order_details
  end
end

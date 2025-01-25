class Public::OrdersController < ApplicationController
  before_action :authenticate_customer!
  def new
    @order = Order.new
    if @order.save
      redirect_to orders_confirm_path
    else
      render :new
    end
  end

  def confirm
    @order = Order.new(order_params)
    @cart_items = current_customer.cart_items
    @order.postage = 800
    @sum = 0
    @total_payment = 0
    if params[:order][:option] == "own_address"
      @order.address = current_customer.address
      @order.postal_code = current_customer.postal_code
      @order.name = current_customer.last_name + current_customer.first_name
    elsif params[:order][:option] == "registered_address"
      selected_address = Address.find(params[:order][:address_id]) 
      @order.address = selected_address.address
      @order.postal_code = selected_address.postal_code
      @order.name = selected_address.name
      #ここより下の記述はあってもなくても良い。すでに８行目でデータ受け取り済みのため。
    elsif params[:order][:option] == "new_address"
      @order.address = params[:order][:address]
      @order.postal_code = params[:order][:postal_code]
      @order.name = params[:order][:name]
    end
  end

  def complete
  end

  def create
    @order = Order.new(order_params)
      @order.save!

      current_customer.cart_items.each do |cart_item|
        @order_detail = OrderDetail.new
        @order_detail.item_id = cart_item.item_id
        @order_detail.amount = cart_item.amount
        @order_detail.price = (cart_item.item.price*1.1).floor
        @order_detail.order_id = @order.id
        @order_detail.save
      end

      current_customer.cart_items.destroy_all
      redirect_to orders_complete_path
  end

  def index
    @orders = current_customer.orders
  end

  def show
    @order = Order.find(params[:id])
    @order.postage = 800
    @order_details = @order.order_details
    @sum = 0
    @order.order_details.each do |order_detail|
      @sum += order_detail.price * order_detail.amount
    end
    
  end

  private

  def order_params
    params.require(:order).permit(:customer_id, :name, :postal_code ,:address ,:payment_method ,:postage ,:total_payment )
  end
end

class Admin::OrdersController < ApplicationController
  before_action :authenticate_admin!
  def show
    @order = Order.find(params[:id])
    @order_details = @order.order_details
    @order.postage = 800
    @total_payment = @order_details.sum(:subtotal)
    @order.total_payment = @order.postage + @total
  end

  def update
    @order = Order.find(params[:id])
    @order.status.update(order_params)
    redirect_to admin_order_path(@order.id)
  end

  private

  def order_params
    params.require(:@order).permit(:status)
  end
end

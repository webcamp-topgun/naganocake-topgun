class Admin::OrderDetailsController < ApplicationController
  before_action :authenticate_admin!
  def update
    @order = Order.find(params[:id])
    @order_details = @order.order_details
    order_detail.update(order_detail_params)
    redirect_to admin_order_path(@order.id)
  end

  private

  def order_detail_params
    params.require(:order_detail).permit(:cooking_status)
  end
end

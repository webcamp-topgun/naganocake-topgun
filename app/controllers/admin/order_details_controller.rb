class Admin::OrderDetailsController < ApplicationController
  before_action :authenticate_admin!
  def update
    @order_detail = OrderDetail.find(params[:id])
    @order = @order_detail.order
    @order_details = @order.order_details.all
#製作ステータスに応じて注文ステータスを変動させる記述
    is_updated = true
    if @order_detail.update(order_detail_params)
      @order.update(status: "in_production") if @order_detail.cooking_status == "in_production"

      @order_details.each do |order_detail|
        if order_detail.cooking_status != "production_completed"
          is_updated = false
        end
      end
      @order.update(status: "in_preparation_for_shipping") if is_updated
    end
    redirect_to admin_order_path(@order)
  end

  private

  def order_detail_params
    params.require(:order_detail).permit(:cooking_status)
  end
end
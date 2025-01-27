class Admin::OrdersController < ApplicationController
  before_action :authenticate_admin!
  def show
    @order = Order.find(params[:id])
    @order_details = @order.order_details
    #商品合計の定義
    @sum = 0
    #請求額合計の定義
    @total_payment = 0
  end

  def update
    @order = Order.find(params[:id])
    @order_details = @order.order_details
    #注文ステータスに連動して製作ステータスを変動させる記述
    if @order.update(order_params)
      @order_details.update_all(cooking_status: "pending_production") if @order.status == "payment_confirmation"
    end
    redirect_to admin_order_path(@order.id)
  end

  private

  def order_params
    params.require(:order).permit(:status)
  end
end

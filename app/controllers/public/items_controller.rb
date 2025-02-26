class Public::ItemsController < ApplicationController
  def index
    @items = Item.page(params[:page]).per(8)
  end

  def show
    @item = Item.find(params[:id])
    @tax_include_price = (@item.price * 1.1).floor
    @cart_item = CartItem.new
  end
end

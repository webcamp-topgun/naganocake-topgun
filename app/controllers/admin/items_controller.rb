class Admin::ItemsController < ApplicationController

  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if params[:is_active] == "true"
      params[:item][:is_active] = true
    else
      params[:item][:is_active] = false
    end
    @item.save
    redirect_to admin_items_path
  end

  def show
    @item = Item.find(params[:id])
    @tax_include_price = (@item.price * 1.1).round(1)
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    @item.update(item_params)
    redirect_to admin_items_path
  end

  private
  def item_params
    params.require(:item).permit(:image, :name, :caption, :genre_id, :price, :is_active)
  end
end

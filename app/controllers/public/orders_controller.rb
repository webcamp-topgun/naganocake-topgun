class Public::OrdersController < ApplicationController
  before_action :authenticate_customer!
  def new
    @order = Order.new
    @postal_code = params[:postal_code]
    @address = params[:address]
    @name = params[:name]
  end

  def confirm
  end

  def complete
  end

  def create
  end

  def index
  end

  def show
  end
end

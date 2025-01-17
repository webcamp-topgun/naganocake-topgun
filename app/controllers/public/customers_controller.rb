class Public::CustomersController < ApplicationController
  before_action :authenticate_customer!
  def show
    @customer = current_customer
    @addresses = current_customer
  end

  def edit
    @customer = current_customer
    @addresses = current_customer
  end

  def update
    @customer = current_customer
    if @customer.update(customer_params)
    flash[:success] = "会員情報が更新されました。"
    redirect_to my_page_path
  else
    render :edit
  end

  end

  def unsubscribe
  end

  def withdraw
  end


end

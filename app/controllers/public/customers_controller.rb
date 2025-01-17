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
    @customer = current_customer
    @customer.update(is_active: false)
    reset_session
    flash[:notic] = "退会処理を実行しました"
    redirect_to root_path
  end

  private

  def customer_params
    params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :postal_code, :address, :phone_number, :email)
  end

end

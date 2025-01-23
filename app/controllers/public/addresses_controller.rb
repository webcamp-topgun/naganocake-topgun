class Public::AddressesController < ApplicationController
  before_action :authenticate_customer!
  def index
    @address = Address.new
    @customer = current_customer
    @addresses = @customer.addresses

  end

  def edit
    @address = Address.find(params[:id])
    
  end

  def create
    @address = Address.new(address_params)
    @address.customer_id =current_customer.id
    @address.save
    redirect_to addresses_path
  end

  def update
    @address = Address.find(params[:id])
    if @address.update(address_params)
    flash[:success] = "配送先情報が更新されました。"
    redirect_to addresses_path
  else
    render :edit
  end
end

  def destroy
    address = Address.find(params[:id])
    address.destroy
    redirect_to addresses_path
  end

  def address_params
    params.require(:address).permit(:postal_code, :address, :name)
  end
end

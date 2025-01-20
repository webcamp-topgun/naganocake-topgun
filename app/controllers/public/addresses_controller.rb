class Public::AddressesController < ApplicationController

  def index
    @address = Address.new
    @addresses = Address.all
  end

  def edit
  end

  def create
    address = Address.new(address.params)
    address.save
    redirect_to '/addresses'
  end

  def update
  end

  def destroy
  end

  def address_params
    params.require(:address).permit(:postal_code, :address, :name)
  end
end

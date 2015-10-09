class AddressesController < ApplicationController
  before_action :find_address, only: [:show, :edit, :udpate, :destroy]

  def index
    @addresses = Address.all
  end

  def show
    @addresses = Address.where(address_id: params[:id])
    #TODO: I don't think this is right.
  end

  def new
    @address = Address.new
  end

  def create
    @address = Address.new(address_params)

    if @address.save
      redirect_to address_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @address.update(address_params)
      redirect_to addresses_path
    else
      render :edit
    end
  end

  def destroy
    @address.destroy
    redirect_to addresses_path
  end

  private

  def address_params
    params.require(:address).permit()
  end

  def find_address
    @address = Address.find(params[:id])
  end

end

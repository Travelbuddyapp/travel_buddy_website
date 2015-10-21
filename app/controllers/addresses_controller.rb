class AddressesController < ApplicationController
  before_action :address, only: [:edit, :update, :destroy]

  def new
    @address = Address.new
  end

  def create
    @address = Address.new(address_params)
    if @address.save
      redirect_to account_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @address.update(address_params)
      redirect_to account_path
    else
      render :edit
    end
  end

  def destroy
    @address.destroy
    redirect_to account_path
  end

  private

  def address
    @address = Address.find(params[:id])
  end

  def address_params
    params.require(:address).permit(:latitude, :longitude, :address, :user_id, :reservation_id)
  end

end

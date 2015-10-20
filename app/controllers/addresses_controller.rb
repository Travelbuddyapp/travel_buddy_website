class AddressesController < ApplicationController
  # before_action :find_user
  # before_action :find_trip
  # before_action :find_reservation
  before_action :address, only: [:edit, :update, :destroy]
  # This was set up for a reservation address, we may need to add
  # more in to cover user address...  TODO?
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

  def find_user
    @user = current_user
  end

  def find_trip
    @trip = Trip.find(params[:trip_id])
  end

  def find_reservation
    @reservation = Reservation.find(params[:reservation_id])
  end

  def address
    @address = Address.find(params[:id])
  end

  def address_params
    params.require(:address).permit(:latitude, :longitude, :address, :user_id, :reservation_id)
  end

end

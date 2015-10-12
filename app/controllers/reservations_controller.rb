class ReservationsController < ApplicationController
include StiHelper

before_action :set_user
before_action :set_trip
before_action :find_reservation, only: [:show, :edit, :update, :destroy]
  
  def index
    @reservation = Reservation.all
  end

  def new
    @reservation = Reservation.new
  end

  def create
    @reservation = Reservation.new(reservation_params)
    if @reservation.save
      redirect_to reservation_path
    else
      render 'new'
    end
  end

  def show
  end

  def edit
  end

  def update
    if @reservation.update(reservation_params)
      redirect_to reservation_path
    else
      render 'edit'
    end
  end

  def destroy
    @reservation.destroy method: :delete
    redirect_to reservation_path
  end

  private

  def set_user
    # @user = User.find(params[:user_id])
    @user = User.find(current_user)
  end

  def set_trip
    @trip = Trip.find(params[:trip_id])
  end

  def find_reservation
    @reservation = Reservation.find(params[:id])
  end

  def reservation_params
    params.require(:reservation).permit(:business_name, :confirmation_number, :check_in_date, :check_out_date, :note)
  end

end

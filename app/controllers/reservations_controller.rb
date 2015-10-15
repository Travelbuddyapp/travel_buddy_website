class ReservationsController < ApplicationController
  before_action :find_user
  before_action :find_trip
  before_action :find_reservation, only: [:show, :edit, :update, :destroy]
  accepts_nested_attributes_for :addresses, allow_destroy: true
  
  def index
    @reservation = Reservation.all
  end

  def new
    @reservation = Reservation.new(trip_id: params[:trip_id])
  end

  def create
    @reservation = Reservation.new(reservation_params)
    if @reservation.save
      redirect_to user_trip_reservations_path(current_user, @trip)
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
      redirect_to user_trip_reservations_path(current_user, @trips)
    else
      render 'edit'
    end
  end

  def destroy
    @reservation.destroy
    redirect_to user_trip_reservations_path(current_user, @trips)
  end

  private

  def find_user
    @user = User.find(current_user.id)
  end

  def find_trip
    @trip = Trip.find(params[:trip_id])
  end

  def find_reservation
    @reservation = Reservation.find(params[:id])
  end

  def reservation_params
    params.require(:reservation).permit(:type, :business_name, :confirmation_number, :check_in_date, :check_out_date, :note)
  end

end

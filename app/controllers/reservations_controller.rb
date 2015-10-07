class ReservationsController < ApplicationController
before_action :find_reservation, only: [:show, :edit, :update, :destroy]
  
  def index
    @reservation = Reservation.all
  end

  def show
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

  def reservation_params
    params.require(:reservation).permit(:business_name, :confirmation_number, :check_in_date, :check_out_date, :note)
  end

  def find_reservation
    @reservation = Reservation.find(params[:id])
  end
end

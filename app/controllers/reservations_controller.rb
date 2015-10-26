class ReservationsController < ApplicationController
  before_action :user
  before_action :trip, except: [:by_type]
  before_action :reservation, only: [:show, :edit, :update, :destroy]
  
  def by_type
    reservations = Reservation.joins(:trip).where('trips.user_id = ?', current_user.id).by_type
    render json: { reservations: reservations }
  end

  def index
  end

  def new
    @reservation = type_class.new
    @address = @reservation.address || Address.new
  end

  def create
    @reservation = @trip.reservations.new(reservation_params)
    @reservation.user_id = current_user.id
    if @reservation.save
      redirect_to trip_path(@trip)
    else
      render :new
    end
  end

  def show
  end

  def edit
    @address = @reservation.address || Address.new
  end

  def update
    if @reservation.update(reservation_params)
      redirect_to trip_reservation_path(@trip, @reservation)
    else
      render :edit
    end
  end

  def destroy
    @reservation.destroy
    redirect_to trip_path(@trip)
  end

  private

  def user
    @user = current_user
  end

  def trip
    @trip = Trip.find(params[:trip_id])
  end

  def reservation
    @reservation = type_class.find(params[:id])
  end

  def set_type
    @type = type
  end

  def type
    Reservation.types.include?(params[:type]) ? params[:type] : "Reservation"
  end

  def type_class
    type.constantize
  end

  def reservation_params
    params.require(type.underscore.to_sym).permit(:type, :business_name, :confirmation_number, :check_in_date, :check_out_date, :note, address_attributes: [:address])
  end

end
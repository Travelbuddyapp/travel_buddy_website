class TripsController < ApplicationController

  before_action :trip, only: [:show, :edit, :update, :destroy]
  before_action :user
  before_action :restrict_trip_access

  def index
    @trips = Trip.where(user_id:@user)
  end

  def new
    @trip = Trip.new
  end

  def create
    @trip = @user.trips.new(trip_params)
    if @trip.save
      redirect_to trip_path(@trip)
    else
      render :new
    end
  end

  def show
    @reservations = @trip.reservations
    @checklists = @trip.checklists
    @ice = @user.contacts.where('contacts.id = ?', @trip.ice_id.to_i).limit(1)[0]
  end

  def edit
  end

  def update
    if @trip.update(trip_params)
      redirect_to trip_path(@trip)
    else
      render :edit
    end
  end

  def destroy
    @trip.destroy
    redirect_to trips_path
  end

  private
  
  def user
    @user = current_user
  end

  def trip
    @trip = Trip.find(params[:id])
  end

  def trip_params
    params.require(:trip).permit(:name, :description, :start_date, :end_date, :ice_id)
  end

  def restrict_trip_access 
    if @trip
      restrict_access if @trip.user_id != current_user.id
    end
  end
end


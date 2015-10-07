class TripsController < ApplicationController
  before_action :find_trip, only: [:show, :edit, :update, :destroy]
  
  def index
    @trip = Trip.all
  end

  def show
  end

  def new
    @trip = Trip.new
  end

  def create
    @trip = Trip.new(trip_params)
    if @trip.save
      redirect_to trip_path
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @trip.update(trip_params)
      redirect_to trip_path
    else
      render 'edit'
    end
  end

  def destroy
    @trip.destroy method: :delete
    redirect_to trip_path
  end

  private

  def trip_params
    params.require(:trip).permit(:name, :description, :start_date, :end_date, :ice_id)
  end

  def find_trip
    @trip = Trip.find(params[:id])
  end
end
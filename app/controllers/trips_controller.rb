class TripsController < ApplicationController
  before_action :trip, only: [:show, :edit, :update, :destroy]
  before_action :user

  def index
    @trips = Trip.where(user_id:params[:user_id])
  end

  def new
    @trip = Trip.new
  end

  def create
    @trip = Trip.new(trip_params)
    if @trip.save
      redirect_to user_trips_path(@user)
    else
      render 'new'
    end
  end

  def show
  end

  def edit
  end

  def update
    if @trip.update(trip_params)
      redirect_to user_trip_path(@user,@trip)
    else
      render 'edit'
    end
  end

  def destroy
    @trip.destroy
    redirect_to user_trips_path(@user)
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
end


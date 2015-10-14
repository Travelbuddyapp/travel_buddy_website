class TripsController < ApplicationController
  before_action :find_user
  before_action :find_trip, only: [:show, :edit, :update, :destroy]
  
  def index
    @trip = Trip.all
  end

  def new
    # @user = User.find(params[:user_id])
    @trip = Trip.new(user_id: current_user)
  end

  def create
    @trip = Trip.new(trip_params)
    # @user = User.find(params[:user_id])
    if @trip.save
      redirect_to user_trips_path(current_user, @trips)
    else
      render 'new'
    end
  end

  def show
  end

  def edit
  end

  def update
    # @user = User.find(current_user)
    if @trip.update(trip_params)
      redirect_to user_trips_path(current_user, @trips)
    else
      render 'edit'
    end
  end

  def destroy
    # @user = User.find(current_user)
    @trip.destroy #method: :delete
    redirect_to user_trips_path(current_user, @trips)
  end

  private

  def find_user
    @user = User.find(current_user.id)
  end

  def find_trip
    @trip = Trip.find(params[:id])
  end

  def trip_params
    params.require(:trip).permit(:name, :description, :start_date, :end_date, :ice_id)
  end
end

class StaticPagesController < ApplicationController
  skip_before_filter :authenticate_user!, only: [:about_us]
  before_action :user, only: [:home, :account]

  def home
    @trip = Trip.all
    @reservation = Reservation.all
    @checklist = Checklist.all
  end

  def account
  end

  def about_us
  end

  private

  def user
    @user = current_user
  end

  def trip_params
    params.require(:user).permit(:name, :description, :start_date, :end_date, :ice_id)
  end

end

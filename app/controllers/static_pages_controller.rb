class StaticPagesController < ApplicationController
  skip_before_filter :authenticate_user!, only: [:about_us]
  
  def home
    @user = current_user
    @trip = Trip.all
    @reservation = Reservation.all
    @checklist = Checklist.all
  end

  def account
    @user = User.find(current_user)
  end

  def about_us
  end

  private

  def trip_params
    params.require(:user).permit(:name, :description, :start_date, :end_date, :ice_id)
  end

end

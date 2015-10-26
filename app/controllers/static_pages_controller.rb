class StaticPagesController < ApplicationController
  skip_before_filter :authenticate_user!, only: [:about_us]
  before_action :user, only: [:home, :account]

  def by_type
    binding.pry
    render json: { reservations: current_user.reservations.by_type }
  end #TODO: do we need this here or in reservations controller when done?

  def home
    @trips = Trip.where(user_id:@user)
    @reservations = Reservation.where(user_id:current_user).order(:check_in_date).limit(5)
    @checklists = Checklist.where(user_id:current_user).order(:due_date).limit(5)
  end

  def account
    
  end

  def about_us
  end

  private

  def user
    @user = current_user
  end

end

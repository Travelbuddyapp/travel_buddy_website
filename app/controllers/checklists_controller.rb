class ChecklistsController < ApplicationController
  before_action :find_user
  before_action :find_trip
  before_action :restrict_checklist_access
  before_action :checklist, only: [:show, :edit, :update, :destroy]

  def index
    @checklists = Checklist.where(trip_id:@trip)
  end

  def new
    @checklist = Checklist.new
  end

  def create
    @checklist = @trip.checklists.new(checklist_params)
    @checklist.user_id = current_user.id
    if @checklist.save
      redirect_to trip_checklist_path(@trip, @checklist)
    else
      render :new
    end
  end

  def show
    @list_items = ListItem.where(checklist_id: params[:id])
  end

  def edit
  end

  def update
    begin @checklist.update(checklist_params)
      redirect_to trip_checklist_path(@trip, @checklist)
    rescue => e
      flash[:error] = "Please add a list item before submitting."
      redirect_to trip_checklist_path(@trip, @checklist)
    end
  end

  def destroy
    @checklist.destroy
    redirect_to trip_checklists_path(@trip)
  end

  private
  
  def find_user
    @user = current_user
  end

  def find_trip
    @trip = Trip.find(params[:trip_id])
  end

  def checklist
    @checklist = Checklist.find(params[:id])
  end

  def checklist_params
    params.require(:checklist).permit(:title, :due_date, list_items_attributes: [:id, :content, :completed, :checklist_id, :_destroy])
  end
  
  def restrict_checklist_access 
    if @trip
      restrict_access if @trip.user_id != current_user.id
      # restrict_access if checklist.user_id != current_user.id
    end
  end
end


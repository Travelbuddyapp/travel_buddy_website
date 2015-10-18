class ChecklistsController < ApplicationController
  before_action :find_user
  before_action :find_trip
  before_action :checklist, only: [:show, :edit, :update, :destroy]

  def index
    @checklists = Checklist.where(trip_id:@trip)
  end

  def new
    @checklist = Checklist.new
  end

  def create
    @checklist = @trip.checklists.new(checklist_params)
    if @checklist.save
      redirect_to trip_checklists_path(@trip)
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
   
    if @checklist.update(checklist_params)
      redirect_to trip_checklists_path(@trip)
    else
      render :edit
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
    params.require(:checklist).permit(:title, :due_date)
  end
  
end


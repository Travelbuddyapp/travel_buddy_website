class ListItemsController < ApplicationController
  before_action :find_trip
  before_action :find_checklist
  before_action :find_list_item, only: [:edit, :update, :destroy]
  # didn't include show/index since those actions are covered by
  # show page 4 checklist, where 1 checklist will show ALL related list_items
  def new
    @list_item = @checklist.list_items.new
  end

  def create
    @list_item = ListItem.new(list_item_params)
    if @list_item.save
      redirect_to trip_checklist_path(@trip, @checklist)
    else
      render :new
    end  
  end

  def edit
  end

  def update
    if @list_item.update(list_item_params)
      redirect_to trip_checklists_path(@trip)
    else 
      render :edit 
    end  
  end

  def destroy
    @list_item.destroy
    redirect_to trip_checklist_path(@trip, @checklist) 
  end  

  private

  def find_trip
    @trip = Trip.find(params[:trip_id])
  end

  def find_checklist
    @checklist = Checklist.find(params[:checklist_id])
  end

  def find_list_item
    @list_item = ListItem.find(params[:id])
  end

  def list_item_params
    params.require(:list_item).permit(:content, :completed, :checklist_id)
  end
end

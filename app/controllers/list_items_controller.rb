class ListItemsController < ApplicationController
  before_action :find_user
  before_action :find_trip
  before_action :find_checklist
  before_action :list_item, only: [:edit, :update, :destroy]
  skip_before_action :require_permission

  def new
    @list_item = ListItem.new
  end

  def create
    @list_item = @checklist.list_items.new(list_item_params)
    if @list_item.save
      redirect_to trip_path(@trip)
    else
      render :new
    end  
  end

  def edit
  end

  def update
    if @list_item.update(list_item_params)
      render nothing: true
    else 
      flash[:error] = "Unable to update item"
      redirect_to trip_checklist_path(@trip, @checklist)
    end  
  end

  def destroy
    @list_item.destroy
    redirect_to trip_checklist_path(@trip, @checklist)
  end  

  private

  def find_user
    @user = current_user
  end

  def find_trip
    @trip = Trip.find(params[:trip_id])
  end

  def find_checklist
    @checklist = Checklist.find(params[:checklist_id])
  end

  def list_item
    @list_item = ListItem.find(params[:id])
  end

  def list_item_params
    params.require(:list_item).permit(:content, :completed)
  end

end

class ChecklistsController < ApplicationController
  def index
    @checklists = Checklist.all
  end

  def show
    @checklist = Checklist.find(params[:id])
    @list_items = List_item.where(checklist_id: params[:id])
    #not sure on if ^ is List_item, ListItem, or something else...
  end

  def new
    @checklist = Checklist.new
  end

  def create
    @checklist = Checklist.new(checklist_params)
 
    if @checklist.save
      redirect_to checklist_path
      # TODO check if checklist_path is correct?
    else
      render :new
    end
  end

  def edit
    @checklist = Checklist.find(params[:id])
  end

  def update
    @checklist = Checklist.find(params[:id])
   
    if @checklist.update(checklist_params)
      redirect_to checklists_path
    else
      render :edit
    end
  end

  def destroy
    @checklist = Checklist.find(params[:id])
    @checklist.destroy
    redirect_to checklists_path
  end

 private

  def checklist_params
    params.require(:checklist).permit(:title, :due_date, :trip_id, :user_id)
  end
end


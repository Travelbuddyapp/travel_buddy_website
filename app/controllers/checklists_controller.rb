class ChecklistsController < ApplicationController
  before_action :find_checklist, only: [:show, :edit, :update, :destroy]

  def index
    @checklists = Checklist.all
  end

  def show
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
  end

  def update
   
    if @checklist.update(checklist_params)
      redirect_to checklists_path
    else
      render :edit
    end
  end

  def destroy
    @checklist.destroy
    redirect_to checklists_path
  end

 private

  def checklist_params
    params.require(:checklist).permit(:title, :due_date, :trip_id, :user_id)
  end

  def find_checklist
    @checklist = Checklist.find(params[:id])
  end
end


class ListItemsController < ApplicationController
  # didn't include show/index since those actions are covered by
  # show page 4 checklist, where 1 checklist will show ALL related list_items
  def new
    @checklist = Checklist.find(params[:checklist_id])
    @list_item = @checklist.list_items.new
    # TODO make sure line 4 is correct and review page.
  end

  def create
    @checklist = Checklist.find(params[:checklist_id])
    @list_item = ListItem.new(list_item_params)
    if @list_item.save
      redirect_to course_path(@checklist)
    else
      render :new
    end  
  end

  def edit
    @checklist = Checklist.find(params[:id])
    @list_item = ListItem.find(params[:checklist_id])
  end

  def update
    @checklist = Checklist.find(params[:checklist_id])
    @list_item = ListItem.find(params[:id])
    if @list_item.update(list_item_params)
      redirect_to checklist_path(@checklist)
    else 
      render :edit 
    end  
  end

  def destroy
    @checklist = Checklist.find(params[:checklist_id])
    @list_item = ListItem.find(params[:id])
    @list_item.destroy
      redirect_to checklist_path(@checklist)  
  end  

  private

  def list_item_params
    params.require(:list_item).permit(:content, :completed, :checklist_id)
  end
end

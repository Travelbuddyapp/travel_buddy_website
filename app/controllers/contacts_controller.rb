class ContactsController < ApplicationController
  before_action :user
  before_action :contact, only: [:show, :edit, :update, :destroy]

  def index
    @contact = Contact.where(user_id: current_user.id)
  end

  def new
    @contact = Contact.new
  end

  def create
    @contact = @user.contacts.new(contact_params)
    if @contact.save
      redirect_to contacts_path
    else
      render 'new'
    end
  end

  def show
  end

  def edit
  end

  def update
    if @contact.update(contact_params)
      redirect_to contact_path(@contact)
    else
      render 'edit'
    end
  end

  def destroy
    @contact.destroy
    redirect_to contacts_path
  end

  private

  def user
    @user = current_user
  end

  def contact
    @contact = Contact.find(params[:id])
  end

  def contact_params
    params.require(:contact).permit(:name, :phone_number, :email, :note_field, :ice)
  end

end

class VaccinesController < ApplicationController
  before_action :find_user
  before_action :find_vaccine, only: [:show, :edit, :update, :destroy]

  def index
    @vaccine = Vaccine.all
  end

  def new
    @vaccine = Vaccine.new
  end

  def create
    @vaccine = Vaccine.new(vaccine_params)
    if @vaccine.save
      redirect_to vaccines_path
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @vaccine.update(vaccine_params)
      redirect_to vaccine_path(@vaccine)
    else
      render 'edit'
    end
  end

  def destroy
    @vaccine.destroy
    redirect_to vaccines_path
  end

  private

  def find_user
    @user = User.find(current_user.id)
  end

  def find_vaccine
    @vaccine = Vaccine.find(params[:id])
  end

  def vaccine_params
    params.require(:vaccine).permit(:name, :details, :administration_method, :date_given, :expiration_date)
  end
  
end


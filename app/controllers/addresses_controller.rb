class AddressesController < ApplicationController
  before_action :address, only: [:show, :edit, :update, :destroy]
  before_action :user

  def index
  end

  def show
  end

  def new
    @address = Address.new
  end

  def create
    @address = Address.new(address_params)
    @address.user = @user
    if @address.save
      redirect_to user_path(@user)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @address.update(address_params)
      redirect_to user_path(@user)
    else
      render :edit
    end
  end

  def destroy
    @address.destroy
    redirect_to user_path(@user)
  end

  private

  def address_params
    params.require(:address).permit(:latitude, :longitude, :address)
  end

  def address
    @address = Address.find(params[:id])
  end

  def user
    @user = User.find(params[:user_id])
  end

end

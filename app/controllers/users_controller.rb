class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end
# Below is handled by devise!
  def new
  end

  def edit
  end
end

class UsersController < ApplicationController
  before_action :find_user, only: [:show]
  
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.create(user_params)
    if @user.save
      redirect_to user_path(@user)
    else
      render :new
    end
  end
  
  
  def show
  end
  
  def edit
  end

  private
  def find_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :username, :age, :password)
  end
end

class UsersController < ApplicationController
  def show
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    name = params.require(:user).permit(:name)
    @user = User.new(name)
    if @user.save
      redirect_to users_path
    else
      render :new
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to users_path
  end
end

class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
  end

  def create
    @user = User.create(user_params)
    @user.password = params[:password]
    if @user.save
    redirect_to @user
    else
      render 'new'
    end
  end

private

  def user_params
    params.require(:user).permit(:name, :email)
  end

end

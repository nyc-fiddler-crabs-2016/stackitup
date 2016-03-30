class UsersController < ApplicationController
  skip_before_action :logged_in?, only: [:new, :create]

  def index
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(current_user)
    else
      flash[:notice] = "There was a problem with your information, please try again"
      render new_user_path
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      redirect_to user_path
    else
      flash[:notice] = "There was a problem"
    end

  end

  def edit
    @user = User.find(params[:id])
  end

  def destroy
  end

  private
  def user_params
    params.require(:user).permit(:username, :email, :description, :password )
  end


end

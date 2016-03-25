class SessionsController < ApplicationController
  skip_before_action :logged_in?, only: [:new, :create]

  def new
  end

  def create
    user = User.find_by(username: params[:user][:username])
    if user && user.authenticate(params[:user][:password])
      session[:user_id] = user.id
      redirect_to user_path(current_user)
    else
      flash[:alert] = "Please check your login information and try again"
      redirect_to new_session_path
    end
  end

  def destroy
    session.clear
    redirect_to "/"
  end

end

class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user, :logged_in?

  before_action :logged_in?

  def current_user
    User.find(session[:user_id]) if session[:user_id]
  end


  def logged_in?
    unless current_user
      flash[:alert] = "You must be logged in!"
      redirect_to '/'
    end
  end

end

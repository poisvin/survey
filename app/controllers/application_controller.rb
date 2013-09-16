class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :current_user
  before_filter :authenticate


private

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  
  def authenticate
  	unless current_user
  		flash[:notice] = "Please log in or sign up to take the survey"
      redirect_to root_path and return false
    end
  end

  def admin_login
    unless current_user && current_user.admin?
      flash[:notice] = "Access restricted"
      redirect_to root_url and return false
    end
  end

end

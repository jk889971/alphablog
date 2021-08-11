class ApplicationController < ActionController::Base

  helper_method :current_user, :logged_in?

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def logged_in?
    !!current_user
  end

  def require_user
    if !logged_in?
      flash[:alert] = "You must be logged in to perform this action"
      redirect_to login_path
    end
  end

  def require_same_user
    if current_user != @article.user && !current_user.admin?
      flash[:alert] = "You're not allowed to perform this action"
      redirect_to @article
    end
  end

end

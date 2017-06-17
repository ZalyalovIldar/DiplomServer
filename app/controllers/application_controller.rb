class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  # protect_from_forgery with: :exception


  before_action :check_auth

  def check_auth
    if current_user.nil?
      session[:load_url] = request.url
      redirect_to new_session_path
    end
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def set_current_user(user) # current_user=
    session[:user_id] = user.id
  end

end

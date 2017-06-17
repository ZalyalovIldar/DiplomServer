class SessionsController < ApplicationController

  before_action :check_auth, except: [:new, :create, :destroy]
  before_action :if_auth_redirect

  def new
  end

  def create
    user = User.find_by(login:  params[:login])
    if user && user.authenticate(params[:password])
      set_current_user(user)
      redirect_to (session.delete(:load_url) || root_path)
    else
      redirect_to new_session_path, alert: 'Проверьте логин и пароль'
    end
  end

  def destroy

  end

  private

  def if_auth_redirect
    redirect_to root_path if current_user
  end


end

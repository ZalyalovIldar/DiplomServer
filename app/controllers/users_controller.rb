class UsersController < ApplicationController

  before_action :check_auth, except: [:new, :create]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    unless @user.save
      flash[:alert] = t('flash.register.error')
      render :new and return
    end
    flash[:notice] = t('flash.register.done')
    redirect_to root_path
  end

  private

  def user_params
    params.require(:user).permit(:login, :password)
  end

end

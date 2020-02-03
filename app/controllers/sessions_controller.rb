class SessionsController < ApplicationController
    before_action :check_logout, only: [:new, :create]
  def new
  end

  def create
      user = User.find_by name: params[:session][:name]
      if user && user.authenticate(params[:session][:password])
          log_in user
          remember user
          flash[:success] ="You are logged in"
          if check_admin?
              redirect_to admin_path
          else
              redirect_to root_path
          end
      else
          flash[:danger] = "Invalid username/password combination"
          render :new
      end
  end

  def destroy
    log_out if logged_in?
    flash[:success] = "You are logged out"
    redirect_to login_path
  end

  private
  def check_logout
    unless !logged_in?
        log_out
    end
  end
end

class UsersController < ApplicationController

    def new
      @user = User.new
    end

    def create
      @user = User.new user_params
      if @user.save
          log_in @user
          redirect_to root_path
          flash[:success] = "Signup success"
      else
          flash[:success] = "Signup fails"
          render :new
      end
    end

    private
    def user_params
      params.require(:user).permit :name, :address, :phone, :password, :password_confirmation, :age
    end

end

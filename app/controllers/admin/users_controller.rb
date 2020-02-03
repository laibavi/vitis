class Admin::UsersController < Admin::AdminController
    def index
      @user = User.all
    end

    def edit

    end

    def update
        @user = User.find_by id: params[:user][:id]
        respond_to do |format|
            if @user.update_attributes user_params
                format.html{redirect_to @user}
                format.js{}
                format.json { render json: @user }
            else
                format.html{}
                format.json{render json:@user.errors }
            end
        end
    end

    def destroy
      @user = User.find_by id: params[:id]
      @id = params[:id]
      respond_to do |format|
          if @user.destroy
              format.html{}
              format.js{}
              format.json {}
              flash[:success] = "Xoá thành công"
          else
              format.html
              format.json { render @user.errors }
          end
      end
    end

    def update_admin
      #code
    end

    private
    def user_params
        params.require(:user).permit :name, :address, :phone, :password, :password_confirmation, :age, :admin
    end
end

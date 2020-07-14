class UsersController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :show ]

    def show
        @user = User.find(params[:id])
        @current_user = current_user
    end

    def edit
        @user = User.find(params[:id])
    end

    def update
        @user = User.find(params[:id])
        
        if @user.update(user_params)
          redirect_to request.referrer, notice: "Your particulars are updated! "
        else
            render :edit, alert: "Your particulars couldn't be updated. "
        end
    end
    
    def destroy
        @user = User.find(params[:id])
    end 

    private

  def user_params
    params.require(:user).permit(:firstname, :lastname, :email, :goal)
  end
end

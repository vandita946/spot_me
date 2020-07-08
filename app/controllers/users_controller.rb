class UsersController < ApplicationController

    def show
        @user = User.find(params[:id])
    end

    def edit
        @user = User.find(params[:id])
    end

    def update
        @user = User.find(params[:id])
        
        if @user.update(user_params)
          redirect_to request.referrer, notice: "user updated! "
        else
            render :edit, alert: "Your particulars couldn't be updated. "
        end
    end
    
    def destroy
        @user = User.find(params[:id])
    end 

    private

  def user_params
    params.require(:user).permit(:firstname, :lastname, :email)
  end
end

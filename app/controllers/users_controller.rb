class UsersController < ApplicationController
  skip_before_action :authenticate_user!, only: [:show]


    def requests
      @user = current_user
      @requests = @user.requests
      authorize @user
    end


    def show
        @user = User.find(params[:id])
        @current_user = current_user
        authorize @user
    end

    def edit
        @user = User.find(params[:id])
        authorize @user
    end

    def update
        @user = User.find(params[:id])
        authorize @user

        if @user.update(user_params)
          redirect_to request.referrer, notice: "Your particulars are updated! "
        else
            render :edit, alert: "Your particulars couldn't be updated. "
        end
    end

    def destroy
        @user = User.find(params[:id])
        authorize @user
    end

    private

  def user_params
    params.require(:user).permit(:firstname, :lastname, :email, :goal)
  end
end

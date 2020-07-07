class GoalsController < ApplicationController

  def index
    @user = current_user
    @goals = Goal.where(params[@user_id])
  end

  def new
    @goal = Goal.new
  end

  def create
    @goal = Goal.new(params[:goal])
    @goal.user = current_user
    if @goal.save
    redirect_to goals_path, notice: "Your goal has been added"
    else
      render "new", alert: "Your goal is missing something "
    end
  end

  def show
    @goal = Goal.find(params[:id])
  end

  def edit
    @goal = Goal.find(params[:id])
  end

  def update
    @goal = Goal.find(params[:id])
    @goal.update(goal_params)
    redirect_to goal_path(@goal)
  end

  def destroy
    @goal = Goal.find(params[:id])
    @goal.destroy
    redirect_to goals_path
  end

  private

  def goal_params
    params.require(:goal).permit(:title, :description, :deadline, :progress, :status)
  end

end

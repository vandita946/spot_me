class GoalsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:show, :new, :create]

  def index
    @user = current_user
    @goals = @user.goals
  end

  def new
    @goal = Goal.new
    @goal.user = current_user
  end

  def create
    @goal = Goal.new(goal_params)
    @goal.user = current_user
    if @goal.save
    redirect_to goals_path, notice: "Your goal has been added"
    else
      render "new", alert: "Your goal is missing something "
    end
  end

  def show
    @goal = Goal.find(params[:id])

    # @chatroom = Chatroom.where(@goal)
    # @message = Message.new
    authorize @goal
  end

  def edit
    @goal = Goal.find(params[:id])
  end

  def update
    @goal = Goal.find(params[:id])
    
    if @goal.update(goal_params)
      redirect_to request.referrer, notice: "Goal updated! "
    else
        render :edit, alert: "Your goal couldn't be updated. "
    end
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

  def get_latest(goal)
    incomplete = goal.milestones.where(is_completed: false)
    sorted = incomplete.sort_by &:deadline
    return sorted.first
  end
end

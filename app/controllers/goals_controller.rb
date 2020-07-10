class GoalsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:show, :new, :create]

  def index
    @user = current_user
    @goals = @user.goals.sort_by(&:deadline)

    @goals.each do |goal|
      if goal.deadline <= Date.today
        goal.status = "Past"
      end
    end
    @completion_message = CompletionMessage.new
  end

  def new
    @goal = Goal.new
    @goal.user = current_user
    @goal_connection = GoalConnection.new
  end

  def create

    @goal = Goal.new(goal_params)
    @goal.user = current_user
    @chatroom = Chatroom.new(topic: @goal)


    if @goal.start_date >= Date.today
      @goal.status = "Not started"
    else
      @goal.status = "In Progress"
    end

    if @goal.save && @chatroom.save
      # && (@goal.deadline >= Date.today)

      redirect_to goals_path, notice: "Your goal has been added"
    else
      render "new", alert: "Your goal is missing something "
    end
  end

  def show
    @goal = Goal.find(params[:id])
    if @goal.deadline <= Date.today
      @goal.status = "Past"
    end

    @milestones = @goal.milestones.sort_by(&:deadline)
    @chatroom = Chatroom.where(topic: @goal)[0]
    @message = Message.new
    @completion_message = CompletionMessage.new
    # authorize @goal
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

  # def icon_for(goal)
  #   @icon = goal.icon
  #   if @icon.empty?
  #       @icon_goal = image_tag("", alt: goal.name)
  #   else
  #       @icon_goal = image_tag(@icon.url, alt: goal.name)
  #   end
  #   return @icon_goal
  # end

  def goal_params
    params.require(:goal).permit(:icon, :title, :description, :deadline, :progress, :status, :start_date, :logo)
  end

  def get_latest(goal)
    incomplete = goal.milestones.where(is_completed: false)
    sorted = incomplete.sort_by &:deadline
    return sorted.first
  end

end

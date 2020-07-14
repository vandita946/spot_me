class GoalConnectionsController < ApplicationController
  before_action :permit_parameters

  def create
    @goal_connection = GoalConnection.new(goal: Goal.find(params[:goal_connection][:goal]), connection: Connection.find(params[:goal_connection][:connection]), status: "Requested")
    authorize @goal_connection
    if @goal_connection.save
      redirect_to request.referrer, notice: "Your buddy has been invited! "
    else
      redirect_to request.referrer, alert: "Your buddy couldn't be added. "
    end
  end

  def edit
    @goal_connection = GoalConnection.find(params[:id])
    authorize @goal_connection
  end

  def update
    @goal_connection = GoalConnection.find(params[:id])
    authorize @goal_connection
    if @goal_connection.update(status: params[:goal_connection][:status])
      redirect_to request.referrer, notice: "You're now #{@goal_connection.connection.owner.firstname}'s buddy! "
    else
      render :edit, alert: "Your request could not be updated. "
    end

  end

  private

  def permit_parameters
    params.permit!
  end
end


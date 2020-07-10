class GoalConnectionsController < ApplicationController
  before_action :permit_parameters

  def create
    @goal_connection = GoalConnection.new(goal: Goal.find(params[:goal_connection][:goal]),
                                          connection: Connection.find(params[:goal_connection][:connection])
                                          )
    binding.pry
    if @goal_connection.save
      redirect_to request.referrer, notice: "You're buddy has been invited! "
    else
      redirect_to request.referrer, alert: "Your buddy couldn't be added. "
    end
  end

  private

  def permit_parameters
    params.permit!
  end
end


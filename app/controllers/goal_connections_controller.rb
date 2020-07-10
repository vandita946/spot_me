class GoalConnectionsController < ApplicationController
  def create
    binding.pry
    @goal_connection = GoalConnection.new(goal_connection_params)
  end

  private

  def goal_connection_params

  end
end

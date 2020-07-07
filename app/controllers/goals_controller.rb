class GoalsController < ApplicationController
    skip_before_action :authenticate_user!, only: [:show, :new, :create]

    def index
        @goals = Goal.all
    end

    def new
        @goal = Goal.new
    end

    def create
        @goal = Goal.new(goal_params)
        # Optional since you can create a goal without signing up
        # @goal.user_id = current_user
        if @goal.save
            # please review this path at a later date/time because the route to the dashboard is not created yet
            redirect_to goals_path, notice: "Your Goal has been added"
        else
            render "new", alert: "Your goal could not be saved"
        end

    end

    def update
        @goal = Goal.find(params[:id])
        @goal.update(goal_params)
        redirect_to goals_path, notice: "Your goal has been updated"
      end

    def show
        @goal = Goal.find(params[:id])
        authorize @goal
    end
end

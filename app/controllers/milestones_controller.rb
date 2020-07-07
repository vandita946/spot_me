class MilestonesController < ApplicationController

    def index
        @goal = Goal.find(params[:goal_id])
        @milestones = @goal.milestones
    end

    def new
        @goal = Goal.find(params[:goal_id])
        @milestone = Milestone.new
    end

    def create
        @goal = Goal.find(params[:goal_id])
        @milestone = Milestone.new(milestone_params)
        @goal.milestone = @milestone
        if @milestone.save
            redirect_to goal_path(@goal), notice: "Milestone successfully created! "
        else
            render :new, alert: "Your milestone couldn't be added. "
        end
    end

    def edit
        @milestone = Milestone.find(params[:id])
    end

    def update
        @milestone = Milestone.find(params[:id])
        if @milestone.update(milestone_params)
            redirect_to request.referrer, notice: "Milestone updated! "
        else
            render :edit, alert: "Your milestone couldn't be updated. "
        end
    end

    private

    def milestone_params
        params.require(:milestone).permit(:name, :deadline, :weightage, :is_completed)
    end

end

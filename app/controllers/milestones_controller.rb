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

    def update_progress(goal)
        # milestone weightage is 1-5.
        # progress is supposed to be a percentage / 100
        total = 0
        completed = 0
        goal.milestones.each do |milestone|
          total += milestone.weightage
          if milestone.is_completed == true
            completed += milestone.weightage
          end
        end
        goal.progress = completed/total * 100 
    end

    def add_to_progress(milestone)
        # milestone weightage is 1-5.
        # progress is supposed to be a percentage / 100
        total = 0
        milestone.goal.milestones.each do |milestone|
          total += milestone.weightage
        end
        progress = milestone.goal.progress
        new_progress = ((progress/100) + (1/total))*100
        milestone.goal.progress = new_progress
        raise
    end

end

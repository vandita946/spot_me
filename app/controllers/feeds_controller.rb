class FeedsController < ApplicationController
  def index
    @user = current_user
    @goals = @user.goals

    # create array with all users milestones
    # sort i
    @user_milestones = []
    @goals.each do |goal|
      goal.milestones.each do |milestone|
        @user_milestones << milestone
      end
    end

    @sorted_milestones = @user_milestones.sort_by(&:updated_at).reverse
    end


    # @feeds = @goals.milestones.sort_by {|a| a.deadline}.reverse

end


def get_latest
    incomplete = self.milestones.where(is_completed: false)
    sorted = incomplete.sort_by(&:deadline).first
  end

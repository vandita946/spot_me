class FeedsController < ApplicationController
  def index
    @user = current_user
    @goals = @user.goals

    @feeds = (@goals.milestones).sort_by {|a| a.deadline}.reverse

  end
end

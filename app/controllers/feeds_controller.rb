class FeedsController < ApplicationController
  def index
    @user = current_user
    @goals = @user.goals
    @connections = @user.connections

    updates_milestones
    updates_goals_creation

    @feed = policy_scope(Feed)

    # updates_new_buddy_goal

    # create sort_everything function
  end

  private

  def updates_milestones
    @user_milestones = []
    @goals.each do |goal|
      goal.milestones.each { |milestone| @user_milestones << milestone }
    end
    @sorted_milestones = @user_milestones.sort_by(&:updated_at).reverse
  end

  def updates_goals_creation
    # get goals created at
    @creation_date_sorted_goals = @goals.sort_by(&:created_at).reverse
  end

  def updates_goals_creation
    # get goals created at
    @creation_date_sorted_goals = @goals.sort_by(&:created_at).reverse
  end

  # def updates_buddy_milestones
  #   # find user buddies & goals
  #   @user_buddy_milestones = []



  #   @creation_date_sorted_goals = @goals.sort_by(&:created_at).reverse
  # end

  def sort_everything
    # find a way to sort things with different attribute / created_at and updated_at
  end
end

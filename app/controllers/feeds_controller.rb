class FeedsController < ApplicationController
  def index
    @user = current_user
    @goals = @user.goals
    @connections = @user.connections

    sort_news
  end

  private

  def user_milestones
    @user_milestones = []
    @goals.each do |goal|
      goal.milestones.each { |milestone| @user_milestones << milestone }
    end
    @user_milestones
  end

  def updates_buddy_goals_creation
    @buddy_goals = []
    @user.fullinfo_buddyofs.each do |hash|
      @buddy_goals << hash[:goal]
    end
  end

  def updates_buddy_milestones
    @buddy_milestones = []
    @user.fullinfo_buddyofs.each do |hash|
      @buddy_milestones << hash[:milestones]
    end
    @buddy_milestones.flatten!
  end

  def sort_news
    user_milestones
    updates_buddy_goals_creation
    updates_buddy_milestones
    @sorted_news = [@user_milestones, @goals, @buddy_goals, @buddy_milestones].flatten!

    @sorted_news.sort_by! { |news| [news[:updated_at]] }.reverse!
  end
end

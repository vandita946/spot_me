class GoalPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.where(user: user)
    end
  end

  def create?
    return true
  end

  def show?
    # if user is owner or if user is buddy >> define method in private
    return true
  end

  def view?
    user_is_owner? || user_is_buddy?
  end

  def update?
    user_is_owner?
  end

  def destroy?
    user_is_owner?
  end

  private

  def user_is_owner?
    record.user == user
  end

  def user_is_buddy?
    record.buddies.include? user
  end

end

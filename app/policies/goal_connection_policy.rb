class GoalConnectionPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.where(user: user)
      # or if user is connection >> define method in private
    end
  end

  def create?
    return true
  end

  def show?
    user_is_owner?
    # or if user is connection >> define method in private
  end

  def destroy?
    user_is_owner?
  end

  private

  def user_is_owner?
    record.user == user
  end

  def user_is_connection?
    # define method
  end
end

class MilestonePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.where(user: user)
    end
  end

  def create?
    user_is_owner?
  end

  def show?
    user_is_owner?
    # or if user is buddy >> define method in private
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
    # define method
  end

end

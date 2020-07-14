class MessagePolicy < ApplicationPolicy
  def show?
    record.user == user # || user is connection || user is buddy
  end

  def create?
    return true
  end

  def show?
    user_is_owner?
    # or if user is buddy or connection >> define method in private
  end

  private

  def user_is_owner?
    record.user == user
  end

  def user_is_connection?
  end

  def user_is_buddy?
  end
end

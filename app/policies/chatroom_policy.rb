class ChatroomPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.where(user: user) # || user is connection || user is buddy
    end
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

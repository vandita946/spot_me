class CompletionMessagePolicy < ApplicationPolicy



  def show?
    user_is_owner?
  end

  private

  def user_is_owner?
    record.user == user
  end
end

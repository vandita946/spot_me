class UserPolicy < ApplicationPolicy
  def create
    return true
  end

  def requests?
    return true
  end

  def show?
    return true
  end

  def update?
    user_is_owner?
    # For documentation purposes - fact check:
    # - record: the restaurant passed to the `authorize` method in controller
    # - user:   the `current_user` signed in with Devise.
  end

  def destroy?
    user_is_owner?
  end

  private

  def user_is_owner?
    record.user == user
  end
end

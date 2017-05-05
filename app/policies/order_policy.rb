class OrderPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def create?
    true
  end

  def index?
    user.admin
  end

  def show?
    return user.admin if user

    if record.created_at > 1.hour.ago
      true
    else
      false
    end
  end
end

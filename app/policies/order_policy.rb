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
    true
  end
end

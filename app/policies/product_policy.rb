class ProductPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all.reorder("sku")
    end
  end
end

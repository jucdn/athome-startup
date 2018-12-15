class BuildingPolicy < ApplicationPolicy
  def show?
    true
  end
  class Scope < Scope
    def resolve
      scope.all
    end
  end
end

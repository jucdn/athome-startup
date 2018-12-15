class UserPolicy < ApplicationPolicy

  def update?
    user.is_admin? or record.id == user.id
  end
  
  class Scope < Scope
    def resolve
      scope.all
    end
  end
end

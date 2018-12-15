class EventPolicy < ApplicationPolicy
  def create?
    true
  end
  
  def update?
    user.is_admin? or record.user_id == user.id
  end
  
  def destroy?
    user.is_admin? or record.user_id == user.id
  end
end

class ChatPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def create?
    true
  end

  def show?
    (record.sender_id == user.id) || (record.recipient_id == user.id)
  end
end

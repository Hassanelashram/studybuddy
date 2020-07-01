class PaymentPolicy < ApplicationPolicy
 def new?
  user.present? && record.student == user
 end
end

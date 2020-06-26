class DashboardPolicy < Struct.new(:user, :dashboard)
 def show?
  user.present?
 end

 def allbookings?
  user.present?
  end

  def allearnings?
    user.present?
  end
end

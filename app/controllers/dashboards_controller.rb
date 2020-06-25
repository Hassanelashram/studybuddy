class DashboardsController < ApplicationController
  def show
    @reviews = Review.where(reviewed_id: current_user.id)
    authorize :dashboard, :show?
  end

  def allbookings
    authorize :dashboard, :allbookings?
  end

  def allearnings
    authorize :dashboard, :allearnings?
  end
end

class DashboardsController < ApplicationController
  def show
    @reviews = Review.where(reviewed_id: current_user.id)
    authorize :dashboard, :show?
  end
end

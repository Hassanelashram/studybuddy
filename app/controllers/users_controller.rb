class UsersController < ApplicationController
  def index
    query = params[:query]
    if query.present? && params[:type] == 'student'
      @users = User.joins(learning_subjects: :subject).where("subjects.name ILIKE ?", query)
    elsif query.present?
      @users = User.joins(teaching_subjects: :subject).where("subjects.name ILIKE ?", query)
    else
      @users = User.all
    end
  end

  def profile
    @user = User.find(params[:id])
  end

  private
end

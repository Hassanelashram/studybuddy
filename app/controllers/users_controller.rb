class UsersController < ApplicationController
  def index
    query = params[:query]
    if query.present?
      @students = User.joins(learning_subjects: :subject).where("subjects.name ILIKE ?", query)
      @teachers = User.joins(teaching_subjects: :subject).where("subjects.name ILIKE ?", query)
    else
      @user = User.all
    end
  end

  def profile
    @user = User.find(params[:id])
  end
end

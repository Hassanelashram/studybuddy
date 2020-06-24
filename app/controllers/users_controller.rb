class UsersController < ApplicationController
  def index
    query = params[:query]
    if query.present? && params[:type] == 'student'
      @users = policy_scope(User).joins(learning_subjects: :subject).where("subjects.name ILIKE ?", query)
    elsif query.present?
      @users = policy_scope(User).joins(teaching_subjects: :subject).where("subjects.name ILIKE ?", query)
    else
      @users = policy_scope(User)
    end
  end

  def profile
    @user = User.find(params[:id])
    @review = Review.new
    @reviews = Review.where(reviewed_id: @user.id)
    authorize @user
  end
end

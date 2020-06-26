class UsersController < ApplicationController
  def index
    query = params[:query]
    if query.present? && params[:city].present? && params[:type] == 'student'
      @users = policy_scope(User).joins(learning_subjects: :subject).where("subjects.name ILIKE ? AND location = ?", query, params[:city])
    elsif query.present? && params[:type] == 'student'
      @users = policy_scope(User).joins(learning_subjects: :subject).where("subjects.name ILIKE ?", query)
    elsif query.present? && params[:city].present?
      @users = policy_scope(User).joins(teaching_subjects: :subject).where("subjects.name ILIKE ? AND location = ?", query, params[:city])
    elsif query.present?
      @users = policy_scope(User).joins(teaching_subjects: :subject).where("subjects.name ILIKE ?", query)
    else
      @users = policy_scope(User)
    end
  end

  def autocomplete
    if params[:query].present?
      subjects = Subject.where("name ILIKE ?", "#{params[:query]}%").limit(4)
    else
      subjects = []
    end
    skip_authorization
    render json: { subjects: subjects.pluck(:name) }
  end

  def profile
    @user = User.find(params[:id])
    @booking = Booking.new
    @review = Review.new
    @reviews = Review.where(reviewed_id: @user.id)
    authorize @user
  end
end

class UsersController < ApplicationController
  def index
    query = params[:query]
    @users = policy_scope(User)
    if query.present?
      if params[:type] == 'student'
        @users = @users.joins(learning_subjects: :subject).where("subjects.name ILIKE ?", query)
      else
        @users = @users.joins(teaching_subjects: :subject).where("subjects.name ILIKE ?", query)
      end
    end

    if params[:city].present?
      @users = @users.where("location = ?", params[:city])
    end

    if params[:language].present?
      @users = @users.where("language = ?", params[:language])
    end

    if params[:price].present?
      if params[:price] == 'low_first'
      @users = @users.order(price: :asc)
    else
      @users = @users.order(price: :desc)
    end
    end
    # if query.present? && params[:city].present? && params[:type] == 'student'
    #   @users = policy_scope(User).joins(learning_subjects: :subject).where("subjects.name ILIKE ? AND location = ?", query, params[:city])
    # elsif query.present? && params[:type] == 'student'
    #   @users = policy_scope(User).joins(learning_subjects: :subject).where("subjects.name ILIKE ?", query)
    # elsif query.present? && params[:city].present?
    #   @users = policy_scope(User).joins(teaching_subjects: :subject).where("subjects.name ILIKE ? AND location = ?", query, params[:city])
    # elsif query.present?
    #   @users = policy_scope(User).joins(teaching_subjects: :subject).where("subjects.name ILIKE ?", query)
    # else
    #   @users = policy_scope(User)
    # end
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

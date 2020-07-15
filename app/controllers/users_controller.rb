class UsersController < ApplicationController
  def index
    query = params[:query]
    @users = policy_scope(User).paginate(page: params[:page], per_page: 5)
    if params[:type] == 'student'
      @users = @users.joins(:learning_subjects).where.not(learning_subjects: { id: nil }).distinct
    else
      @users = @users.joins(:teaching_subjects).where.not(teaching_subjects: { id: nil }).distinct
    end
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
      @users = @users.order(price_cents: :asc)
    else
      @users = @users.order(price_cents: :desc)
    end
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

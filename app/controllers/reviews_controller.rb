class ReviewsController < ApplicationController

  def create
    @user = User.find(params[:user_id])
    @review = Review.new(review_params)
    @review.reviewer = current_user
    @review.reviewed = @user
    # authorize @review
    unless @review.save
      flash[:alert] = @review.errors.full_messages.first
    end
    redirect_to profile_path(@user)

    authorize @review
  end

  private

  def review_params
    params.require(:review).permit(:content, :stars)
  end

end

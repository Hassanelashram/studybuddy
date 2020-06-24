class ReviewsController < ApplicationController

  def create
    @user = User.find(params[:user_id])
    @review = Review.new(review_params)
    @review.reviewer = current_user
    @review.reviewed = @user
    # authorize @review
    if @review.save
      redirect_to profile_path(@user)
    else
      render "users/profile"
    end
  end

  private

  def review_params
    params.require(:review).permit(:content, :stars)
  end

end

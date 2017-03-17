class ReviewsController < ApplicationController

  def create

    @review = Review.new(review_params)

    @review.user_id = current_user.id

    @review.product_id = params[:product_id]
    page_number = params[:product_id]

    @review.user = current_user

    if @review.save

      redirect_to '/'
    else

      redirect_to '/products/#{page_number}/reviews'

    end
  end








  def review_params
      params.require(:review).permit(:rating, :description)
  end


end

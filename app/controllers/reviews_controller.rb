class ReviewsController < ApplicationController

   before_action :require_login

  def create
    @review = Review.new(review_params)
    @review.user_id = current_user.id
    @review.product_id = params[:product_id]
    page_number = params[:product_id].to_i
    @review.user = current_user
    if @review.save
      redirect_to "/products/#{page_number}"
    else
      redirect_to '/'
    end
  end

  def destroy
    @review_d = Review.find params[:id]
    @review_d.destroy

    redirect_to "/products/#{@review_d.product_id}"

  end

 private

  def require_login
    if ! current_user
      flash[:error] = "You must be logged in to access this section"
      redirect_to new_login_url # halts request cycle
    end
  end

  def review_params
      params.require(:review).permit(:rating, :description)
  end


end

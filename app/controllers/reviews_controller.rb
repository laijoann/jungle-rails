class ReviewsController < ApplicationController
  include PluralizeHelper
  before_action do |controller|
   unless controller.send(:current_user)
     flash[:error] = "You must be logged in to access this section"
     redirect_to @product
   end
 end
  def create
    @product = Product.find(params[:product_id])
    @review = @product.reviews.new(review_params)
    @review.name = "#{current_user.first_name} #{current_user.last_name}"
    if @review.save
      redirect_to @product
    else
      render 'products/show'
    end
  end
  def destroy
    @product = Product.find(params[:product_id])
    @review = @product.reviews.find(params[:review_id])
    @review.destroy
    redirect_to @product, notice: 'Review deleted!'
  end
  private
    def review_params
      params.require(:review).permit(:description, :name, :rating)
    end
end

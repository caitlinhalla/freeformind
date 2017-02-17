class ReviewsController < ApplicationController
  before_action :authenticate_user!

  def new
    @product = Product.find(params[:product_id])
    @review = @product.reviews.new
  end

  def create
    @product = Product.find(params[:product_id])
    @review = @product.reviews.new(review_params)
    @review.user_id = current_user.id
    if @review.save
      redirect_to product_path(@product)
    else
      redirect_to new_product_review_path(@product)
    end
  end

  def show
    @product = Product.find(params[:id])
    @reviews = Review.all
  end

private
  def review_params
    params.require(:review).permit(:author, :content, :rating, product_id: @product.id)
  end

end

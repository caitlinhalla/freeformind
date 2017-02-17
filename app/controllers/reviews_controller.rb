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
      flash[:notice] = "Your review was saved!"
      redirect_to product_path(@product)
    else
      flash[:alert] = "Oops!"
      redirect_to new_product_review_path(@product)
    end
  end

  def edit
    @product = Product.find(params[:product_id])
    @review = Review.find(params[:id])
  end

  def update
    @product = Product.find(params[:product_id])
    @review = Review.find(params[:id])
    if @review.update(review_params)
      flash[:notice] = "Your changes have been saved!"
      redirect_to product_path(params[:product_id])
    else
      flash[:alert] = "Oops!"
      redirect_to edit_product_review_path(params[:product_id], params[:id])
    end
  end

private
  def review_params
    params.require(:review).permit(:author, :content, :rating, product_id: @product.id)
  end

end

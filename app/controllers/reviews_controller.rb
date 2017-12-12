class ReviewsController < ApplicationController
  def new
    @product = Product.find(params[:product_id])
    @reviews = @product.reviews
    @review = @product.reviews.new(review_params)
    @review.user = current_user
    @review.save
  end

  def create
    @product = Product.find(params[:product_id])
    @review = @product.reviews.new(review_params)
    if @review.save
      redirect_to product_path(@review.product)
    else
      render :new
    end
  end

  def edit
    @product = Product.find(params[:product_id])
    @review = @product.reviews.find(params[:id])
    render :edit
  end

  def update
    @product = Product.find(params[:product_id])
    @review = @product.reviews.find(params[:id])
    if @review.update(review_params)
      redirect_to product_path(@review.product)
    else
      render :edit
    end
  end

  def destroy
    @product = Product.find(params[:product_id])
    @review = @product.reviews.find(params[:id])
    @review.destroy
    redirect_to product_path(@product)
  end
private

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
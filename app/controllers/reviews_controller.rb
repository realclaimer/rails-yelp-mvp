class ReviewsController < ApplicationController

  before_action :set_restaurant, only: [:index, :new, :create]

  def index
    @reviews = Review.all
  end

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @review.restaurant = @restaurant
    @review.save
    redirect_to restaurants_path(@restaurant)
  end

  private

  def review_params
    params.require(:reviews).permit(:rating, :content)
  end

  def set_restaurant
    @restaurant = Restaurant.find(params[:restaurant_id])
  end
end

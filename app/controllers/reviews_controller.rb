class ReviewsController < ApplicationController
  before_action :set_restaurant, only: %i[new create]

  def new
    # On trouve le restaurant pour lequel on veut ajouter un avis
    @restaurant = Restaurant.find(params[:restaurant_id])
    # On initialise un nouvel avis
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @review.restaurant = @restaurant
    if @review.save
      redirect_to restaurant_path(@restaurant)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def set_restaurant
    @restaurant = Restaurant.find(params[:restaurant_id])
  end

  def review_params
    params.require(:review).permit(:content)
  end
end

class ReviewsController < ApplicationController
  def index
    @reviews = Review.last(10)
    # eventually add pagination
    @title = "All Reviews"
  end

  def new
  end

  def create
  end

  private

  def review_params
    params.require(:review).permit(:rating, :title, :body)
  end

end

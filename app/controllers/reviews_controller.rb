class ReviewsController < ApplicationController
  def index
    @reviews = Review.order(updated_at: :desc).limit(10)
    # eventually add pagination
    @title = "All Reviews"
  end

  def new
    @review = Review.new
  end

  def create
    @meme = Meme.find(params[:id])
    @review = Review.new(review_params)

    if @review.save
      flash[:notice] = "Success!"
      redirect meme_path(@meme)
    else
      flash[:notice] = "I'm sorry, your review couldn't be saved."
      redirect meme_path(@meme)
    end
  end

  private

  def review_params
    params.require(:review).permit(:rating, :title, :body)
  end

end

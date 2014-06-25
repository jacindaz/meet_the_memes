class ReviewsController < ApplicationController
  def index
    @meme = Meme.find(params[:meme_id])
    @reviews = @meme.reviews
    @title = "All Reviews for #{@meme.name}"
  end

  def new
    @review = Review.new
  end

  def create
    @meme = Meme.find(params[:meme_id])
    @review = Review.new(review_params)
    @review.meme = @meme

    if @review.save
      flash[:notice] = "Success!"
      redirect_to meme_path(@meme)
    else
      flash[:notice] = "I'm sorry, your review couldn't be saved."
      redirect_to meme_path(@meme)
    end
  end

  private

  def review_params
    params.require(:review).permit(:rating, :title, :body)
  end

end

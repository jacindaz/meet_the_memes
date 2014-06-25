class ReviewsController < ApplicationController

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
      render :new
    end
  end

  private

  def review_params
    params.require(:review).permit(:rating, :title, :body)
  end

end

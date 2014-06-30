class ReviewsController < ApplicationController

  def create
    @meme = Meme.find(params[:meme_id])
    @review = Review.new(review_params)
    @review.meme = @meme
    @review.user = current_user

    if @review.save
      flash[:notice] = "Success!"
      redirect_to meme_path(@meme)
    else
      flash[:notice] = "I'm sorry, your review couldn't be saved."
      render :'memes/show'
    end
  end

  private

  def review_params
    params.require(:review).permit(:rating, :title, :body)
  end

end

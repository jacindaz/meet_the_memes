class VotesController < ApplicationController

  def create
    @review = Review.find(params[:review_id])
    @vote = Vote.new(votes_params)
    @vote.review = @review
    @vote.user = current_user

    if @vote.save
      flash[:notice] = "Your vote very thankful."
      redirect_to meme_path(@review.meme)
    else
      @meme = @review.meme
      flash.now[:notice] = "Much fail, your vote saved not."
      render :'memes/show'
    end
  end

  def update
    @review = Review.find(params[:review_id])
    @vote = @review.votes.find(params[:id])

    if current_user.votes.where(review_id: @review).exists?
      if @vote.update(votes_params)
        flash[:notice] = "Change vote such update."
        redirect_to meme_path(@review.meme)
      end
    else
      @meme = @review.meme
      flash.now[:notice] = "Much sorrow, vote not saved."
      render :'memes/show'
    end

  end

  def votes_params
    params.require(:vote).permit(:value)
  end
end

class VotesController < ApplicationController

  def create
    @review = Review.find(params[:review_id])
    @vote = Vote.new(votes_params)
    @vote.review = @review
    @vote.user = current_user
    @meme = @review.meme

    if @vote.save
      flash[:notice] = "Your vote very thankful."
      redirect_to meme_path(@meme)
    else
      flash.now[:notice] = "Much fail, your vote saved not."
      render :'memes/show'
    end
  end

  def update
    @vote = Vote.find(params[:vote_id])
    @meme = @vote.review.meme

    if @vote.update(votes_params)
      flash[:notice] = "Change vote such update."
      redirect_to meme_path(@meme)
    else
      flash.now[:notice] = "Much sorrow, vote not saved."
      render :'memes/show'
    end
  end

  def votes_params
    params.require(:vote).permit(:value)
  end

end

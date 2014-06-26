class VotesController < ApplicationController

  def create
    @review = Review.find(params[:id])
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

  def votes_params
    params.require(:vote).permit(:type)
  end

end

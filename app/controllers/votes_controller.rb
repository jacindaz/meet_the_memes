class VotesController < ApplicationController

  def new
    @vote = Vote.new
  end

  def create
    @review = Review.find(params[:id])
    @vote = Vote.find(votes_params)
    @vote.review = @review

    if @vote.save
      flash[:notice] = "Your vote very thankful."
      redirect_to meme_path(@vote.review.meme)
    else
      flash[:notice] = "Much fail, your vote saved not."
    end
  end

  def votes_params
    params.require(:vote).permit(:type)
  end

end

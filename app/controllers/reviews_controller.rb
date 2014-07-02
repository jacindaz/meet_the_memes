class ReviewsController < ApplicationController
  before_action :authenticate_user!, only: :create
  
  def create
    @meme = Meme.find(params[:meme_id])
    @review = Review.new(review_params)
    @review.meme = @meme
    @review.user = current_user

    respond_to do |format|
      if @review.save
        format.html { redirect_to meme_path(@meme), notice: "Success!" }
        format.js {}
      else
        format.html do 
          flash[:notice] = "I'm sorry, your review couldn't be saved."
          render 'memes/show'
        end
        format.js { head :unprocessable_entity }
      end
    end
  end

  private

  def review_params
    params.require(:review).permit(:rating, :title, :body)
  end

end

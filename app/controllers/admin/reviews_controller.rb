class Admin::ReviewsController < Admin::BaseController

  def destroy
    @review = Review.find(params[:id])
    @meme = @review.meme

    if @review.destroy
      flash[:notice] = "Wow. Much destroy."
      redirect_to admin_meme_path(@meme)
    else
      flash.now[:notice] = "Whoopsie Goldberg. Such trouble."
      render :'admin/memes/show'
    end
  end

end

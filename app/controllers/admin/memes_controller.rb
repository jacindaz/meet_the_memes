class Admin::MemesController < Admin::BaseController

  def index
    @memes = Meme.order(:created_at)
  end

  def show
    @meme = Meme.find(params[:id])
  end

  def destroy
    @meme = Meme.find(params[:id])

    if @meme.destroy
      flash[:notice] = "Wow. Much destroy."
      redirect_to admin_memes_path
    else
      flash.now[:notice] = "Whoopsie Goldberg. Such trouble."
      render :'admin/memes/show'
    end
  end

end

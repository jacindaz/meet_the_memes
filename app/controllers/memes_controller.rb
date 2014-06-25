class MemesController < ApplicationController

  def index
    @memes = Meme.order(:created_at).limit(10)
  end

  def show
    @meme = Meme.find(params[:id])
  end

  def new
    @meme = Meme.new
  end

  def create
    @meme = Meme.new(meme_params)

    if @meme.save
      flash[:notice] = "Creates teh meme!!!"
      redirect_to meme_path(@meme)
    else
      flash.now[:notice] = "Whoopsie Goldberg. Such trouble."
      render :new
    end
  end

  def edit
    @meme = Meme.find(params[:id])
  end

  def update
    @meme = Meme.find(params[:id])

    if @meme.update(meme_params)
      flash[:notice] = "Updates teh meme!"
      redirect_to meme_path(@meme)
    else
      flash.now[:notice] = "Whoopsie Goldberg. Such trouble."
      render :edit
    end
  end

  def destroy
    @meme = Meme.find(params[:id])

    if @meme.destroy
      flash[:notice] = "Wow. Much destroy."
      redirect_to memes_path
    else
      flash.now[:notice] = "Whoopsie Goldberg. Such trouble."
      render :show
    end
  end

  private

  def meme_params
    params.require(:meme).permit(:name, :url, :description)
  end

end

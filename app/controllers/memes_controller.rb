class MemesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  def index
    order_possibilities = ["name", "average_rating"]

    if params[:search]
      @memes = Meme.search(params[:search])
    else
      @memes = Meme.all
    end

    if order_possibilities.include?(params[:order])
      if params[:order] == "average_rating"
        @memes = @memes.order("#{params[:order]} DESC").page(params[:page])
      else
        @memes = @memes.order(params[:order]).page(params[:page])
      end
    else
      @memes = @memes.order(:created_at).page(params[:page])
    end
  end

  def show
    @meme = Meme.find(params[:id])
    @review = Review.new
    @vote = Vote.new
  end

  def new
    @meme = Meme.new
  end

  def create
    @meme = Meme.new(meme_params)
    @meme.user = current_user
    @meme.average_rating = nil

    if @meme.save
      flash[:notice] = 'Creates teh meme!!!'
      redirect_to meme_path(@meme)
    else
      flash.now[:notice] = 'Whoopsie Goldberg. Such trouble.'
      render :new
    end
  end

  def edit
    @meme = Meme.find(params[:id])
  end

  def update
    @meme = Meme.find(params[:id])

    if @meme.update(meme_params)
      flash[:notice] = 'Updates teh meme!'
      redirect_to meme_path(@meme)
    else
      flash.now[:notice] = 'Whoopsie Goldberg. Such trouble.'
      render :edit
    end
  end

  def destroy
    @meme = Meme.find(params[:id])

    if @meme.destroy
      flash[:notice] = 'Wow. Much destroy.'
      redirect_to memes_path
    else
      flash.now[:notice] = 'Whoopsie Goldberg. Such trouble.'
      render :show
    end
  end

  private

  def meme_params
    params.require(:meme).permit(:name, :url, :description, :picture)
  end
end

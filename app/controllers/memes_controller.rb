class MemesController < ApplicationController

  def index
    @memes = Meme.order(:created_at).limit(10)
  end
  
end

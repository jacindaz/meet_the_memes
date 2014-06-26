class AddPictureAndThumbnailToMemes < ActiveRecord::Migration
  def change
    add_column :memes, :picture, :string
  end
end

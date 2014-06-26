class Meme < ActiveRecord::Base
  mount_uploader :picture, PictureUploader

  has_many :reviews

  validates_presence_of :name, :url
end

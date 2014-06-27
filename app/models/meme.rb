class Meme < ActiveRecord::Base
  mount_uploader :picture, PictureUploader

  has_many :reviews

  validates :name, presence: true
end

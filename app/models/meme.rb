class Meme < ActiveRecord::Base
  mount_uploader :picture, MemePictureUploader

  has_many :reviews

  validates :name, presence: true

  def average_rating
    if self.reviews.count > 0
      self.average(:average_rating)
    else
      "So wow. No rating. Such rating."
    end
  end
end

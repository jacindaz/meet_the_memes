class Meme < ActiveRecord::Base
  mount_uploader :picture, PictureUploader

  has_many :reviews

  validates :name, presence: true

  def average_rating
    if self.reviews.count > 0
      sum = self.reviews.inject(0) {|total, each| total += each.to_i}
      sum / self.reviews.count
    end
  end
end

class Meme < ActiveRecord::Base
  mount_uploader :picture, MemePictureUploader

  belongs_to :user
  has_many :reviews, dependent: :destroy

  validates :name, presence: true

  def update_average_rating
    self.update(average_rating: self.reviews.average(:rating))
  end

  def self.search(query)
    where('name ILIKE ?', "%#{query}%")
  end

end

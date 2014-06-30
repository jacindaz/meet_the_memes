class Meme < ActiveRecord::Base
  mount_uploader :picture, MemePictureUploader

  belongs_to :user
  has_many :reviews, dependent: :destroy

  validates :name, presence: true

  def update_average_rating
    self.average_rating = self.reviews.average(:rating)
  end

  def self.search(search)
    if search
      where('name iLIKE ?', "%#{search}%").order(:created_at)
    else
      order(:created_at)
    end
  end

end

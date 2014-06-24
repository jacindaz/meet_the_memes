class Review < ActiveRecord::Base

  validates_presence_of :user_id, :image_id, :rating, :title, :body

  validates :user_id
  validates :image_id
  validates :rating, numericality: { integer: true, greater_than_or_equal_to: 1,
                                      less_than_or_equal_to: 5 }
  validates :title
  validates :body

  validates_inclusion_of :rating, :in => 1..5

end

class Vote < ActiveRecord::Base

  validates :user_id, presence: true, numericality: { integer: true }
  validates :review_id, presence: true, numericality: { integer: true }
  validates :type, presence: true
  validates_inclusion_of :type, :in => [-1, 1]
  validates_uniqueness_of :user_id, scope: :review_id

  belongs_to :user
  belongs_to :review

end

class Vote < ActiveRecord::Base
  belongs_to :user
  belongs_to :review

  validates :user_id, presence: true, numericality: { integer: true }
  validates :review_id, presence: true, numericality: { integer: true }
  validates :value, presence: true
  validates_inclusion_of :value, :in => [-1, 1]
  validates_uniqueness_of :user_id, scope: :review_id

end

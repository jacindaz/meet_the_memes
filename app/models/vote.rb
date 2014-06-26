class Vote < ActiveRecord::Base

  validates :user_id, presence: true
  validates :review_id, presence: true
  validates :type, presence: true

  belongs_to :user
  belongs_to :review

end

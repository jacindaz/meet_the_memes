class Review < ActiveRecord::Base
  belongs_to :meme
  belongs_to :user
  has_many :votes, dependent: :destroy

  validates_presence_of :meme, :rating, :title, :body
  validates_uniqueness_of :title

  validates_uniqueness_of :user_id, scope: :meme_id

  validates :meme_id, numericality: { integer: true }
  validates :rating, numericality: { integer: true, greater_than_or_equal_to: 1,
                                      less_than_or_equal_to: 5 }
  validates :title, length: { minimum: 10, maximum: 90 }
  validates :body, length: {
    minimum: 5,
    maximum: 300,
    tokenizer: lambda { |str| str.scan(/\w+/) },
    too_short: "Must have at least %{count} words.",
    too_long: "Must have less than %{count} words."
  }

<<<<<<< HEAD
  after_create :notify_user

  def notify_user
    Notification.review_posted_notification(self).deliver
  end
=======
  after_save :update_meme_rating

  def update_meme_rating
    self.meme.update_average_rating
  end

  def calculate_popularity
    sum = 0
    votes.all.each do |vote|
      sum += vote.value
    end
    self.update(popularity: sum)
  end

  def has_vote_from?(user)
    votes.find_by(user_id: user.id).present?
  end

  def vote_from(user)
    votes.find_by(user_id: user.id)
  end

>>>>>>> master
end

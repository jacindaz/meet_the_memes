class Review < ActiveRecord::Base
  belongs_to :meme
  belongs_to :user

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

  def has_vote_from?(user)
    Vote.find_by(user_id: user.id, review_id: self.id).present?
  end

  def vote_from(user)
    Vote.find_by(user_id: user.id, review_id: self.id)
  end

end

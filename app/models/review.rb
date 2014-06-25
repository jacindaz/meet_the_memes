class Review < ActiveRecord::Base

  validates_presence_of :user, :meme, :rating, :title, :body
  validates_uniqueness_of :title

  validates :user_id, numericality: { integer: true }
  validates :meme_id, numericality: { integer: true }
  validates :rating, numericality: { integer: true, greater_than_or_equal_to: 1,
                                      less_than_or_equal_to: 5 }
  validates :title, numericality: { integer: false },
            length: { minimum: 10, maximum: 90 }
  validates :body, length: {
    minimum: 5,
    maximum: 300,
    tokenizer: lambda { |str| str.scan(/\w+/) },
    too_short: "Must have at least %{count} words.",
    too_long: "Must have less than %{count} words."
  }

  belongs_to :meme

end

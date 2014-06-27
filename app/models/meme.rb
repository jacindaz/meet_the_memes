class Meme < ActiveRecord::Base
  belongs_to :user
  has_many :reviews, dependent: :destroy

  validates_presence_of :name, :url
end

class Meme < ActiveRecord::Base
	belongs_to :user
	has_many :reviews

	validates_presence_of :name, :url
	validates :average_rating, numericality: {
		greater_than_or_equal_to: 0,
		less_than_or_equal_to: 5
	}
end

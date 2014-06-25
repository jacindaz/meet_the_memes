class Meme < ActiveRecord::Base
  has_many :reviews

  validates_presence_of :name, :url
end

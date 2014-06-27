class User < ActiveRecord::Base
  has_many :reviews, dependent: :destroy
  has_many :memes
  has_many :votes

  validates :email, :password, :password_confirmation, :username, presence: true
  validates :username, length: {minimum: 2, maximum: 25}

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end

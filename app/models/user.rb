class User < ActiveRecord::Base
  mount_uploader :profile_picture, ProfilePictureUploader

  has_many :reviews, dependent: :destroy
  has_many :memes
  has_many :votes

  validates :email, presence: true
  validates :password, presence: true, confirmation: true, length: { minimum: 10 }
  validates :password_confirmation, presence: true
  validates :username, presence: true, length: { minimum: 2, maximum: 25 }

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end

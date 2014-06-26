class User < ActiveRecord::Base
  mount_uploader :profile_picture, ProfilePictureUploader

  validates :email, :password, :password_confirmation, :username, presence: true
  validates :password, confirmation: true, length: { minimum: 10 }
  validates :username, length: { minimum: 2, maximum: 25 }

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end

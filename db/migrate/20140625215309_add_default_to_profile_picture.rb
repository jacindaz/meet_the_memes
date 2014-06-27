class AddDefaultToProfilePicture < ActiveRecord::Migration
  def change
    change_column(:users, :profile_picture, default: 'http://i2.kym-cdn.com/photos/images/newsfeed/000/117/009/soon.jpg')
  end
end

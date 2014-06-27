class RemoveDefaultFromUserProfilePicture < ActiveRecord::Migration
  def change
    change_column_default(:users, :profile_picture, nil)
  end
end

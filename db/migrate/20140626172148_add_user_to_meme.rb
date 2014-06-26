class AddUserToMeme < ActiveRecord::Migration
  def change
    add_column :memes, :user_id, :integer, null: false
  end
end

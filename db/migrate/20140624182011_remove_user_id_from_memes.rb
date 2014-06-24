class RemoveUserIdFromMemes < ActiveRecord::Migration
  def up
    remove_column :memes, :user_id
  end

  def down
    add_column :memes, :user_id, :integer, null: false
  end
end

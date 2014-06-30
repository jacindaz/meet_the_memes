class RemoveNotNullFromMemesPicture < ActiveRecord::Migration
  def change
    change_column :memes, :picture, :string, null: true
  end
  
end

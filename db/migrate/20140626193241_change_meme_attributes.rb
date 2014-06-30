class ChangeMemeAttributes < ActiveRecord::Migration
  def change
    change_column :memes, :picture, :string, null: false
    change_column :memes, :url, :string, null: true
  end
end

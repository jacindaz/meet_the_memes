class MakeUrlNotNullable < ActiveRecord::Migration
  def change
    change_column :memes, :url, :string, null: false
  end
end

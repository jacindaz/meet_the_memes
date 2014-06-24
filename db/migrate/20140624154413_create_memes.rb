class CreateMemes < ActiveRecord::Migration
  def change
    create_table :memes do |t|
      t.integer :user_id, null: false
      t.string :url, null: false
      t.string :name, null: false
      t.text :description
      t.float :average_rating

      t.timestamps
    end
  end
end

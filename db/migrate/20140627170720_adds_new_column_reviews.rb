class AddsNewColumnReviews < ActiveRecord::Migration
  def change
    add_column :reviews, :popularity, :integer, default: 0, null: false
  end
end

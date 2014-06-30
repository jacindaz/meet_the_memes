class AddIndexForReviewPopularity < ActiveRecord::Migration
  def change
    add_index :reviews, :popularity
  end
end

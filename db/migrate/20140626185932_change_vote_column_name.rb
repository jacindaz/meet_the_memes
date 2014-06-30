class ChangeVoteColumnName < ActiveRecord::Migration
  def change
    rename_column(:votes, :type, :value)
  end
end

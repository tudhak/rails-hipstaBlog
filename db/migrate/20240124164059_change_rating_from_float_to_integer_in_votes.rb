class ChangeRatingFromFloatToIntegerInVotes < ActiveRecord::Migration[7.1]
  def change
    change_column :votes, :rating, :integer
  end
end

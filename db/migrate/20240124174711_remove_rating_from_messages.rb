class RemoveRatingFromMessages < ActiveRecord::Migration[7.1]
  def change
    remove_column :messages, :rating, :integer
  end
end

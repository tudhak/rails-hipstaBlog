class RemoveRatingFromArticles < ActiveRecord::Migration[7.1]
  def change
    remove_column :articles, :rating
  end
end

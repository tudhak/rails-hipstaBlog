class AddColumnsToArticles < ActiveRecord::Migration[7.1]
  def change
    add_column :articles, :rating, :integer
    add_column :articles, :date, :date
  end
end

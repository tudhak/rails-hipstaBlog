class AddRatesToArticle < ActiveRecord::Migration[7.1]
  def change
    add_column :articles, :rates, :float, array: true, default: []
  end
end

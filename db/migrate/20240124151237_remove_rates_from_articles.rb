class RemoveRatesFromArticles < ActiveRecord::Migration[7.1]
  def change
    remove_column :articles, :rates, :float
  end
end

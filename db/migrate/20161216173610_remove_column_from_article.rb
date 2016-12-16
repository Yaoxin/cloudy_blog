class RemoveColumnFromArticle < ActiveRecord::Migration[5.0]
  def change
    remove_column :articles, :link, :string
  end
end

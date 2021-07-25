class AddDescriptionToArticles < ActiveRecord::Migration[6.1]
  def change
    # add column :table_name, :attributes, :type
    add_column :articles, :description, :text
  end
end

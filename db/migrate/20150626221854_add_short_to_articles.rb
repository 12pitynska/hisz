class AddShortToArticles < ActiveRecord::Migration
  def change
    		 add_column :articles, :short, :text
  end
end

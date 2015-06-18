class AddLevelToArticles < ActiveRecord::Migration
  def change
    add_reference :articles, :level, index: true
    add_foreign_key :articles, :levels
  end
end


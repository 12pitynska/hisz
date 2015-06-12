class AddCategoryToLinks < ActiveRecord::Migration
  def change
    add_reference :links, :category, index: true
    add_foreign_key :links, :categories
  end
end

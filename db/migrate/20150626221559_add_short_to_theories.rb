class AddShortToTheories < ActiveRecord::Migration
  def change
  		 add_column :theories, :short, :text
  end
end

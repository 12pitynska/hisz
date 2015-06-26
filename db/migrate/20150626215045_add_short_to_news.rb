class AddShortToNews < ActiveRecord::Migration
  def change
  	 add_column :news, :short, :text
  end
end

class AddUserIdToTheories < ActiveRecord::Migration
  def change
    add_column :theories, :user_id, :integer
  end
end

class AddStatusToTheories < ActiveRecord::Migration
  def change
  	add_column :theories, :status, :string

  end
end

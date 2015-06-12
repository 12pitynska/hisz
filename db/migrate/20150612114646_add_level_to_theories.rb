class AddLevelToTheories < ActiveRecord::Migration
  def change
    add_reference :theories, :level, index: true
    add_foreign_key :theories, :levels
  end
end


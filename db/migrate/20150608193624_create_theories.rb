class CreateTheories < ActiveRecord::Migration
  def change
    create_table :theories do |t|
      t.string :title
      t.text :body

      t.timestamps null: false
    end
  end
end

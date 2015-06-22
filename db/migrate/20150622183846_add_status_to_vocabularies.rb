class AddStatusToVocabularies < ActiveRecord::Migration
  def change
  	  	add_column :vocabularies, :status, :string
  end
end

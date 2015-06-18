class AddSpanishToVocabulary < ActiveRecord::Migration
  def change
    add_column :vocabularies, :spanish, :string
    add_column :vocabularies, :description, :text
  end
end

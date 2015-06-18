class AddLevelToVocabularies < ActiveRecord::Migration
  def change
    add_reference :vocabularies, :level, index: true
    add_foreign_key :vocabularies, :levels
  end
end

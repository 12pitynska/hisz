class AddVocabularyToWords < ActiveRecord::Migration
  def change
    add_reference :words, :vocabulary, index: true
    add_foreign_key :words, :vocabularies
  end
end



class AddVocabularyToSurvey < ActiveRecord::Migration
  def change
    add_reference :survey_surveys, :vocabulary, index: true
    add_foreign_key :survey_surveys, :vocabularies
  end
end

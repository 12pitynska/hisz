class AddTheoryToSurvey < ActiveRecord::Migration
  def change
    add_reference :survey_surveys, :theory, index: true
    add_foreign_key :survey_surveys, :theories
  end
end

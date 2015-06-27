class AddLevelidToSurveys < ActiveRecord::Migration
   def change
    add_reference :survey_surveys, :level, index: true
    add_foreign_key :survey_surveys, :levels
  end
end

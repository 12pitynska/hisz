class AddSurveyToTheory < ActiveRecord::Migration
  def change
    add_reference :theories, :survey, index: true
    add_foreign_key :theories, :surveys
  end
end

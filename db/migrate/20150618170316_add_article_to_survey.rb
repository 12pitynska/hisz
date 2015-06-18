class AddArticleToSurvey < ActiveRecord::Migration
  def change
    add_reference :survey_surveys, :article, index: true
    add_foreign_key :survey_surveys, :articles
  end
end


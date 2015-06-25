class AddStatusToSurveys < ActiveRecord::Migration
  def change
  	  	  	add_column :survey_surveys, :status, :string
  end
end

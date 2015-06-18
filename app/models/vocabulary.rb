class Vocabulary < ActiveRecord::Base
	has_many :words, dependent: :destroy
    belongs_to :level
	has_surveys
end

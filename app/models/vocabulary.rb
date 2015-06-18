class Vocabulary < ActiveRecord::Base
	has_many :words, dependent: :destroy


	has_surveys
end

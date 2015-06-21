class Link < ActiveRecord::Base
	  belongs_to :category
	  belongs_to :user
	   paginates_per 5
end

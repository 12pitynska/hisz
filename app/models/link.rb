class Link < ActiveRecord::Base
	  belongs_to :category

	   paginates_per 5
end

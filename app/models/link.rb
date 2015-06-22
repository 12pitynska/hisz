class Link < ActiveRecord::Base
	  belongs_to :category
	  belongs_to :user
	   paginates_per 5



	     scope :approved, -> { where status: 'approved'}
  scope :draft, -> { where status: 'draft'}

end

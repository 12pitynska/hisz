class Link < ActiveRecord::Base
	  belongs_to :category
	  belongs_to :user
	   paginates_per 5



	     scope :approved, -> { where status: 'approved'}
  scope :draft, -> { where status: 'draft'}

  def self.search(query)
    # where(:title, query) -> This would return an exact match of the query
    where("title like ? OR url like ? OR description like ?", "%#{query}%", "%#{query}%", "%#{query}%") 
 
  end

end

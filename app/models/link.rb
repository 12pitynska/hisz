class Link < ActiveRecord::Base
	  belongs_to :category
	  belongs_to :user
	  paginates_per 5

      
    validates :title, presence: true, length: { minimum: 5, maximum: 40 }
    validates :url, presence: true
    validates_format_of :url, :with => URI::regexp(%w(http https))
    validates :description, presence: true, length: { minimum: 5, maximum: 200 }
    validates :category_id, presence: true

	     scope :approved, -> { where status: 'approved'}
  		 scope :draft, -> { where status: 'draft'}

  def self.search(query)
    # where(:title, query) -> This would return an exact match of the query
    where("title like ? OR url like ? OR description like ?", "%#{query}%", "%#{query}%", "%#{query}%") 
 
  end

end

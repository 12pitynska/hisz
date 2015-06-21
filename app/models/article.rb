class Article < ActiveRecord::Base
	  belongs_to :level
	  belongs_to :user
 	  
 	  has_surveys
	  
	  has_attached_file :image, styles: { large: "600x600>", medium: "300x300>", thumb: "150x150#" } 
  
  	  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/



  scope :approved, -> { where status: 'approved'}
  scope :draft, -> { where status: 'draft'}

  def self.search(query)
    # where(:title, query) -> This would return an exact match of the query
    where("title like ? OR body like ?", "%#{query}%", "%#{query}%") 
 
  end

end

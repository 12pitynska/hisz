class Survey < ActiveRecord::Base
	  belongs_to :theory
	  belongs_to :article
	  belongs_to :vocabulary
	  belongs_tu :user


  def self.search(query)
    # where(:title, query) -> This would return an exact match of the query
    where("title like ? OR description like ?", "%#{query}%", "%#{query}%") 
 
  end

end

class Survey < ActiveRecord::Base
    belongs_to :theory
	belongs_to :article
    belongs_to :vocabulary
	belongs_tu :user

    validates :name, presence: true, length: { minimum: 5, maximum: 40 }
    validates :description, presence: true, length: { minimum: 5, maximum: 400 }

	  def self.search(query)
	    where("title like ? OR description like ?", "%#{query}%", "%#{query}%") 
	  end

end

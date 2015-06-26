class Vocabulary < ActiveRecord::Base
	has_many :words, dependent: :destroy
    belongs_to :level
    belongs_to :user
	has_surveys



    validates :polish, presence: true, length: { minimum: 5, maximum: 40 }
    validates :spanish, presence: true, length: { minimum: 5, maximum: 40 }
    validates :description, length: { maximum: 400 }


  def self.search(query)
    # where(:title, query) -> This would return an exact match of the query
    where("polish like ? OR spanish like ? OR description like ?", "%#{query}%", "%#{query}%", "%#{query}%") 
 
  end

end

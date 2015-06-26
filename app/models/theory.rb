class Theory < ActiveRecord::Base
	  belongs_to :level
    belongs_to :user
 	  has_surveys
	  has_attached_file :image, styles: { large: "600x600>", medium: "300x300>", thumb: "150x150#" } 
  
  	validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

    validates :title, presence: true, length: { minimum: 5, maximum: 40 }
    validates :body, presence: true


  def self.search(query)
    where("title like ? OR body like ?", "%#{query}%", "%#{query}%") 
  end



end

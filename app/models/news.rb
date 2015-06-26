class News < ActiveRecord::Base
  has_attached_file :image, styles: { large: "600x600>", medium: "300x300>", thumb: "150x150#" }
  
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

  belongs_to :user
  validates :short, presence: true
  validates :title, presence: true, length: { minimum: 5, maximum: 40 }
  validates :body, presence: true

end
  

class Word < ActiveRecord::Base
	belongs_to :vocabulary

    validates :polish, presence: true, length: { minimum: 1, maximum: 60 }
    validates :spanish, presence: true, length: { minimum: 1, maximum: 60 }
    validates :description, length: { maximum: 400 }

  
end

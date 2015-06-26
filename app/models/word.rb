class Word < ActiveRecord::Base
	 belongs_to :vocabulary

    validates :polish, presence: true, length: { minimum: 5, maximum: 40 }
    validates :spanish, presence: true, length: { minimum: 5, maximum: 40 }
    validates :description, length: { maximum: 400 }

  
end

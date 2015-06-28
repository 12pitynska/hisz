class Level < ActiveRecord::Base
	
	has_many :theories, dependent: :destroy
	has_many :articles, dependent: :destroy
	has_many :vocabularies, dependent: :destroy
    validates :name, presence: true

end

class Level < ActiveRecord::Base
	has_many :theories, dependent: :destroy
end

class Survey < ActiveRecord::Base
	  belongs_to :theory
	  belongs_to :article
	  belongs_to :vocabulary
	  belongs_tu :user
end

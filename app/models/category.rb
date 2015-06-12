class Category < ActiveRecord::Base
has_many :links, dependent: :destroy

end

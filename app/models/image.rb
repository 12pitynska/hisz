class Image < ActiveRecord::Base
	has_attached_file :file, :styles => { :large => "600x600>", :medium => "300x300>", :thumb => "80x80" } 
    validates_attachment_content_type :file, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]



end
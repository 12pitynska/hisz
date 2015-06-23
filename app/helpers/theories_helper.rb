module TheoriesHelper
	def remove_images(text)
    text.gsub(/<img([^>])+/, "")
    end
end

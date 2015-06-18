module ApplicationHelper

def remove_images(text)
  text.gsub(/<img([^>])+/, "")
end

end

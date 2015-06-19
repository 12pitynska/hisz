class TinymceAssetsController < ApplicationController
   before_filter :authenticate_user! 
  load_and_authorize_resource
  respond_to :json

  def create
    image    = Image.create(file: params[:file])
    render json: {
      image: {
        url: root_url+image.file.url
      }
    }, layout: false, content_type: "text/html"
  end

end
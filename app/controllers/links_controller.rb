class LinksController < ApplicationController

#before_action :authenticate_user!, :except => [:index]
  before_action :set_link, only: [:show, :edit, :update, :destroy]
   # authorize_resource
  authorize_resource
  # GET /links
  # GET /links.json
  def index
    @links = Link.where(status: "approved").order('title ASC').page(params[:page]).per(10)
  end

  def list
      @category = Category.find(params[:id]) 
      @links = Link.where(id_category == @category.id)
  end


  def fromcategory
    @category = Category.find(params[:id])
    @links = Link.where(["category_id LIKE ? AND status LIKE ?", @category.id, "approved"]).page(params[:page]).per(10)

  end

  # GET /links/1
  # GET /links/1.json
  def show
  end

  # GET /links/new
  def new
    @link = current_user.links.build
  end

  # GET /links/1/edit
  def edit
  end

  # POST /links
  # POST /links.json
  def create
    @link = current_user.links.build(link_params)
    @link.status = "draft"
    respond_to do |format|
      if @link.save
        format.html { redirect_to @link, notice: 'Link was successfully created.' }
        format.json { render :show, status: :created, location: @link }
      else
        format.html { render :new }
        format.json { render json: @link.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /links/1
  # PATCH/PUT /links/1.json
  def update
    respond_to do |format|
      if @link.update(link_params)
        format.html { redirect_to @link, notice: 'Link was successfully updated.' }
        format.json { render :show, status: :ok, location: @link }
      else
        format.html { render :edit }
        format.json { render json: @link.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /links/1
  # DELETE /links/1.json
  def destroy
    @link.destroy
    respond_to do |format|
      format.html { redirect_to links_url, notice: 'Link was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

def moderation 
  #@articles = Article.all
  @links = Link.where(status:  "draft")
  @approved = Link.where(status:  "approved")
end


  def approve
    Link.where(id: params[:link_ids]).update_all(status: "approved")
        redirect_to moderation_links_path
  end






  private
    # Use callbacks to share common setup or constraints between actions.
    def set_link
      @link = Link.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def link_params
      params.require(:link).permit(:title, :url, :description, :category_id, :user_id, :status)
    end
end

class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy]
#  before_filter :authenticate_user! 
   authorize_resource
  # GET /articles
  # GET /articles.json
  def index
    @articles = Article.where(status: "approved").order('created_at DESC').page(params[:page]).per(5)
  
   
   if params[:search]
      @articles = Article.where(status: "approved").search(params[:search]).order("created_at DESC").page(params[:page]).per(5)
    else
      @articles = Article.where(status: "approved").order('created_at DESC').page(params[:page]).per(5)
    end
  end

  # GET /articles/1
  # GET /articles/1.json
  def show
    @surveys = Survey::Survey.where(article_id: @article.id)
  end

  def fromlevel
    @level = Level.find(params[:id])
    #@articles = Article.where(level_id:  @level.id).page(params[:page]).per(5)
 
    @articles = Article.where(["level_id LIKE ? AND status LIKE ?", @level.id, "approved"]).page(params[:page]).per(5)
  end


  # GET /articles/new
  def new
    # @article = Article.new
      @article = current_user.articles.build
   
  end

  # GET /articles/1/edit
  def edit
  end

  # POST /articles
  # POST /articles.json
  def create
   @article = current_user.articles.build(article_params)
   @article.status = "draft"
    respond_to do |format|
      if @article.save
        format.html { redirect_to articles_path, notice: 'Dziękujemy, artykuł został dodany. Będzie on widoczny w serwisie, po zaakceptowaniu przez moderatora.' }
  
      else
        format.html { render :new }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /articles/1
  # PATCH/PUT /articles/1.json
  def update
    respond_to do |format|
      if @article.update(article_params)
        format.html { redirect_to @article, notice: 'Artykuł został pomyślnie zaktualizowany.' }
        format.json { render :show, status: :ok, location: @article }
      else
        format.html { render :edit }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /articles/1
  # DELETE /articles/1.json
  def destroy
    @article.destroy
    respond_to do |format|
      format.html { redirect_to articles_url, notice: 'Artykuł został usunięty.' }
      format.json { head :no_content }
    end
  end

  def moderation 
    #@articles = Article.all
    @articles = Article.where(status:  "draft")
    @approved = Article.where(status:  "approved")
  end


  def approve
    Article.where(id: params[:article_ids]).update_all(status: "approved")
    redirect_to moderation_articles_path
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_article
      @article = Article.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def article_params
      params.require(:article).permit(:title, :short, :body, :image, :level_id, :user_id, :status)
    end
end

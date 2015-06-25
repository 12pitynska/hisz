class VocabulariesController < ApplicationController
  before_action :set_vocabulary, only: [:show, :edit, :update, :destroy]
 # before_filter :authenticate_user! 
authorize_resource
  # GET /vocabularies
  # GET /vocabularies.json
  def index
    @vocabularies = Vocabulary.where(status: "approved").order('polish ASC').page(params[:page]).per(5)

    if params[:search]
      @vocabularies = Vocabulary.where(status: "approved").search(params[:search]).order("polish ASC").page(params[:page]).per(5)
    else
      @vocabularies = Vocabulary.where(status: "approved").order("polish ASC").page(params[:page]).per(5)
    end

  end

  # GET /vocabularies/1
  # GET /vocabularies/1.json
  def show
        @surveys = Survey::Survey.where(vocabulary_id: @vocabulary.id)

  end

  def fromlevel
    @level = Level.find(params[:id])
  #  @vocabularies = Vocabulary.where(level_id:  @level.id).page(params[:page]).per(5)

    @vocabularies = Vocabulary.where(["level_id LIKE ? AND status LIKE ?", @level.id, "approved"]).page(params[:page]).per(5)


  end

  
  def word
     @words =  Word.where(["vocabulary_id LIKE ? AND status LIKE ?", @vocabulary.id, "approved"])
  end


  # GET /vocabularies/new
  def new
    @vocabulary = current_user.vocabularies.build
  end
  # GET /vocabularies/1/edit
  def edit
  end

  # POST /vocabularies
  # POST /vocabularies.json
  def create
    @vocabulary = current_user.vocabularies.build(vocabulary_params)
   @vocabulary.status = "draft"
    respond_to do |format|
      if @vocabulary.save
        format.html { redirect_to @vocabulary, notice: 'Nowy zestaw słówek został stworzony, możesz uzupełnić słówka używająć poniższego formularza. Słówka będą widoczne w serwisie po zaakceptowaniu przez moderatora.' }
        format.json { render :show, status: :created, location: @vocabulary }
      else
        format.html { render :new }
        format.json { render json: @vocabulary.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /vocabularies/1
  # PATCH/PUT /vocabularies/1.json
  def update
    respond_to do |format|
      if @vocabulary.update(vocabulary_params)
        format.html { redirect_to @vocabulary, notice: 'Zestaw słówek zostal pomyślnie zaktualizowany.' }
        format.json { render :show, status: :ok, location: @vocabulary }
      else
        format.html { render :edit }
        format.json { render json: @vocabulary.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /vocabularies/1
  # DELETE /vocabularies/1.json
  def destroy
    @vocabulary.destroy
    respond_to do |format|
      format.html { redirect_to vocabularies_url, notice: 'Zestaw słówek został pomyślnie usunięty.' }
      format.json { head :no_content }
    end
  end

  def moderation 
    @vocabularies = Vocabulary.where(status:  "draft")
    @approved = Vocabulary.where(status:  "approved")
  end


  def approve
    Vocabulary.where(id: params[:vocabulary_ids]).update_all(status: "approved")
    redirect_to moderation_vocabularies_path
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_vocabulary
      @vocabulary = Vocabulary.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def vocabulary_params
      params.require(:vocabulary).permit(:polish, :spanish, :description, :level_id, :user_id, :status)
    end
end

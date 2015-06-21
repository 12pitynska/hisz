class VocabulariesController < ApplicationController
  before_action :set_vocabulary, only: [:show, :edit, :update, :destroy]
 # before_filter :authenticate_user! 
authorize_resource
  # GET /vocabularies
  # GET /vocabularies.json
  def index
    @vocabularies = Vocabulary.all.order('polish ASC').page(params[:page]).per(5)

  if params[:search]
      @vocabularies = Vocabulary.search(params[:search]).order("polish ASC").page(params[:page]).per(5)
    else
      @vocabularies = Vocabulary.order("polish ASC").page(params[:page]).per(5)
    end

  end

  # GET /vocabularies/1
  # GET /vocabularies/1.json
  def show
        @surveys = Survey::Survey.where(vocabulary_id: @vocabulary.id)

  end

  def fromlevel
    @level = Level.find(params[:id])
    @vocabularies = Vocabulary.where(level_id:  @level.id).page(params[:page]).per(5)
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

    respond_to do |format|
      if @vocabulary.save
        format.html { redirect_to @vocabulary, notice: 'Vocabulary was successfully created.' }
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
        format.html { redirect_to @vocabulary, notice: 'Vocabulary was successfully updated.' }
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
      format.html { redirect_to vocabularies_url, notice: 'Vocabulary was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_vocabulary
      @vocabulary = Vocabulary.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def vocabulary_params
      params.require(:vocabulary).permit(:polish, :spanish, :description, :level_id, :user_id)
    end
end

class WordsController < ApplicationController
  before_action :set_word, only: [:show, :edit, :update, :destroy]
 # before_filter :authenticate_user! 
  load_and_authorize_resource
  # GET /words
  # GET /words.json
  def index
    @words = Word.where(status: "approved")
  end

  # GET /words/1
  # GET /words/1.json
  def show

  end

  # GET /words/new
  def new
    @word = Word.new
  end

  # GET /words/1/edit
  def edit

  @word = Word.find params[:id]
  @vocabulary = Vocabulary.find(params[:vocabulary_id])

  end

  # POST /words
  # POST /words.json
def create

  @vocabulary = Vocabulary.find(params[:vocabulary_id])
   @word.status = "draft"

  @word = @vocabulary.words.create(params[:word].permit(:polish, :spanish, :description, :vocabulary_id))

  redirect_to vocabulary_path(@vocabulary)

end




  # PATCH/PUT /words/1
  # PATCH/PUT /words/1.json
  def update
    @vocabulary = Vocabulary.find(params[:vocabulary_id])
    respond_to do |format|
      if @word.update(word_params)
        format.html {  redirect_to vocabulary_path(@vocabulary), notice: 'Słowo zostało pomyślnie zaktualizowane.' }
        format.json { render :show, status: :ok, location: @word }
      else
        format.html { render :edit }
        format.json { render json: @word.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /words/1
  # DELETE /words/1.json
  def destroy
      @vocabulary = Vocabulary.find(params[:vocabulary_id])
      @word = Word.find params[:id]
    @word.destroy
    respond_to do |format|
      format.html { redirect_to vocabulary_path(@vocabulary), notice: 'Słowo zostało pomyślnie usunięte.' }
      format.json { head :no_content }
    end
  end


  def moderation 
    @words = Word.where(status:  "draft")
    @approved = Word.where(status:  "approved")
  end


  def approve
    Word.where(id: params[:word_ids]).update_all(status: "approved")
    redirect_to moderation_words_path
  end



  private
    # Use callbacks to share common setup or constraints between actions.
    def set_word
      @word = Word.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def word_params
      params.require(:word).permit(:polish, :spanish, :description, :vocabulary_id, :status)
    end
end

class TheoriesController < ApplicationController
  before_action :set_theory, only: [:show, :edit, :update, :destroy]
  # before_filter :authenticate_user! 
  authorize_resource
  # GET /theories
  # GET /theories.json
  
  def index
    @theories = Theory.where(status: "approved").order('title ASC').page(params[:page]).per(5)

    if params[:search]
      @theories = Theory.where(status: "approved").search(params[:search]).order("title ASC").page(params[:page]).per(5)
    else
      @theories = Theory.where(status: "approved").order("title ASC").page(params[:page]).per(5)
    end
  end

  def fromlevel
    @level = Level.find(params[:id])
    @theories = Theory.where(["level_id LIKE ? AND status LIKE ?", @level.id, "approved"]).order("title ASC").page(params[:page]).per(5)
  end

  # GET /theories/1
  # GET /theories/1.json
  def show
    @surveys = Survey::Survey.where(theory_id: @theory.id)
  end

  # GET /theories/new
  def new
    @theory = current_user.theories.build
  end

  # GET /theories/1/edit
  def edit
  end

  # POST /theories
  # POST /theories.json
  def create
    @theory = current_user.theories.build(theory_params)
    @theory.status = "draft"
    respond_to do |format|
      if @theory.save
        format.html { redirect_to theories_path, notice: 'Zagadnienie zostało dodane. Będzie ono widoczne w serwisie po zakceptowaniu przez moderatora.' }
        format.json { render :show, status: :created, location: @theory }
      else
        format.html { render :new }
        format.json { render json: @theory.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /theories/1
  # PATCH/PUT /theories/1.json
  def update
    respond_to do |format|
      if @theory.update(theory_params)
        format.html { redirect_to @theory, notice: 'Zagadnienie zostało pomyślnie zaktualizowane.' }
        format.json { render :show, status: :ok, location: @theory }
      else
        format.html { render :edit }
        format.json { render json: @theory.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /theories/1
  # DELETE /theories/1.json
  def destroy
    @theory.destroy
    respond_to do |format|
      format.html { redirect_to theories_url, notice: 'Zagadnienie zostało pomyślnie usunięte.' }
      format.json { head :no_content }
    end
  end

  def moderation 
    @drafts = Theory.where(status:  "draft")
    @approved = Theory.where(status:  "approved")
  end

  def approve
    Theory.where(id: params[:theory_ids]).update_all(status: "approved")
    redirect_to moderation_theories_path
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_theory
      @theory = Theory.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def theory_params
      params.require(:theory).permit(:title, :short, :body, :image, :level_id, :survey_id, :user_id, :status)
    end
end

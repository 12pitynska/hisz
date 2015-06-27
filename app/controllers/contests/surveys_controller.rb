class Contests::SurveysController < ApplicationController
  before_filter :load_survey, :only => [:show, :edit, :update, :destroy]
 

  authorize_resource
  def index
   @surveys = Survey::Survey.where(status: "approved").order('name ASC').page(params[:page]).per(15)


   @par = Survey::Survey::AccessibleAttributes

   if params[:search]
      @surveys = Survey::Survey.where(status: "approved").search(params[:search]).order("name ASC").page(params[:page]).per(15)   
    else
   @surveys = Survey::Survey.where(status: "approved").order('name ASC').page(params[:page]).per(15)
    end

  end


  def fromlevel
    @level = Level.find(params[:id])
     @surveys = Survey::Survey.where(["level_id LIKE ? AND status LIKE ?", @level.id, "approved"]).page(params[:page]).per(15)
  end


  def new
  

    @survey = Survey::Survey.new
   # @survey.user = current_user
  end

  def create
    @survey = Survey::Survey.new(survey_params)
    @survey.status = "draft"
    @survey.user_id = current_user.id
    if @survey.valid? && @survey.save
        redirect_to surveys_path, notice: 'Quiz został pomyślnie dodany.'
    else
      render :action => :new
    end
  end

  def edit
  end

  def show
    
  end

  def update
    if @survey.update_attributes(survey_params)
      redirect_to surveys_path, notice: 'Quiz został pomyślnie zaktualizowany.'
    else
      render :action => :edit
    end
  end

 def destroy
    @survey.destroy
    redirect_to surveys_path, notice: 'Quiz został pomyślnie usunięty.'
end

def moderation 
    @surveys = Survey::Survey.where(status:  "draft")
    @approved = Survey::Survey.where(status:  "approved")

  end


  def approve
    Survey::Survey.where(id: params[:survey_ids]).update_all(status: "approved")
    redirect_to moderation_surveys_path
  end


  private

    def set_survey
      @survey = Survey.find(params[:id])
    end


  def default_redirect
    redirect_to surveys_path, alert: I18n.t("surveys_controller.#{action_name}")
  end

  def load_survey
    @survey = Survey::Survey.find(params[:id])
  end

  def survey_params
         params.require(:survey_survey).permit([:name, :status, :user_id, :description, :finished, :active, :level_id, :theory_id, :article_id, :vocabulary_id, :attempts_number, {:questions_attributes=>[:text, :survey, {:options_attributes=>[:text, :correct, :weight, :id, :_destroy]}, :id, :_destroy]}, :id, :_destroy])
  end

  def params_whitelist
    params.require(:survey_survey).permit(Survey::Survey::AccessibleAttributes)
  end

end

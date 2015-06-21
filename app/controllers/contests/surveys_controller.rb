class Contests::SurveysController < ApplicationController
  before_filter :load_survey, :only => [:show, :edit, :update, :destroy]
 

  authorize_resource
  def index
   @surveys = Survey::Survey.all.page(params[:page]).per(10)

   @par = Survey::Survey::AccessibleAttributes

  end

  def new
  

    @survey = Survey::Survey.new
   # @survey.user = current_user
  end

  def create
    @survey = Survey::Survey.new(survey_params)
    @survey.user_id = current_user.id
    if @survey.valid? && @survey.save
      default_redirect
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
      default_redirect
    else
      render :action => :edit
    end
  end

 def destroy
    @survey.destroy
    default_redirect
end


  private

  def default_redirect
    redirect_to surveys_path, alert: I18n.t("surveys_controller.#{action_name}")
  end

  def load_survey
    @survey = Survey::Survey.find(params[:id])
  end

  def survey_params
         params.require(:survey_survey).permit([:name, :user_id, :description, :finished, :active, :theory_id, :article_id, :vocabulary_id, :attempts_number, {:questions_attributes=>[:text, :survey, {:options_attributes=>[:text, :correct, :weight, :id, :_destroy]}, :id, :_destroy]}, :id, :_destroy])
  end

  def params_whitelist
    params.require(:survey_survey).permit(Survey::Survey::AccessibleAttributes)
  end

end

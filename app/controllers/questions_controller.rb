class QuestionsController < ApplicationController
  before_action :set_question
  before_action :set_user
  before_action :set_survey_response

  def show
    @answer = Answer.new
  end

  def add_answer
    @answer = Answer.new(answer_params)
    if @answer.save
      next_question = @question.next_question
      if next_question.present?
        redirect_to question_path(next_question, email: @user.email)
      else
        @survey_response.completed!
        @user.send_coupon_email
        flash[:notice] = t('survey_completed')
        redirect_to root_path
      end
    else
      render :show, status: :unprocessable_entity
    end
  end

  private

  def set_question
    @question = Question.find_by(id: params[:id])
    redirect_to root_path unless @question.present?
  end

  def set_user
    @user = User.find_by(email: params[:email])
    redirect_to root_path unless @user.present?
  end

  def set_survey_response
    survey = @question.survey
    @survey_response = SurveyResponse.find_or_create_by(user: @user, survey: survey)
  end

  def answer_params
    params.require(:answer).permit(:question_id, :survey_response_id, :content)
  end
end

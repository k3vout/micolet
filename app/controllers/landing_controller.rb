class LandingController < ApplicationController
  def index
    @user = User.new
    @user.build_user_preference
  end

  def subscribe
    @user = User.new(user_params)
    if @user.save
      @user.send_subscription_email
      flash[:notice] = t('subscribe_success')
      redirect_to available_subscription_survey(@user)
    else
      render :index, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, user_preference_attributes: [:women_fashion, :men_fashion, :children_fashion])
  end

  def available_subscription_survey(user)
    survey = Survey.subscription.last
    root_path unless survey.present?

    first_question = survey.first_question
    root_path unless first_question.present?

    question_path(first_question, email: user.email)
  end
end

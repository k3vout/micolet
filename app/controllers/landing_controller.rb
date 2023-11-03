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
      redirect_to root_path
    else
      render :index, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, user_preference_attributes: [:women_fashion, :men_fashion, :children_fashion])
  end
end

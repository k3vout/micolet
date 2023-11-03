class SubscriptionMailer < ApplicationMailer
  default from: "no-reply@micolet.com"

  def confirmation(user)
    @user = user

    mail to: @user.email, subject: t("subscription_mailer.subject")
  end
end

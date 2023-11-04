class SubscriptionMailer < ApplicationMailer
  default from: "no-reply@micolet.com"

  def confirmation(user)
    @user = user
    mail to: @user.email, subject: t("subscription_mailer.confirmation.subject")
  end

  def coupon(user)
    @user = user
    mail to: @user.email, subject: t("subscription_mailer.coupon.subject_coupon")
  end
end

class User < ApplicationRecord
  # ASSOCIATIONS
  has_one :user_preference, dependent: :destroy
  accepts_nested_attributes_for :user_preference
  has_many :surveys, dependent: :destroy
  has_many :survey_responses, dependent: :destroy

  # VALIDATIONS
  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validate :email_exists_in_abstract

  def send_subscription_email
    SubscriptionMailer.confirmation(self).deliver_now
  end

  def send_coupon_email
    SubscriptionMailer.coupon(self).deliver_now
  end

  private

  def email_exists_in_abstract
    unless EmailValidatorService.new(email: email).valid?
      errors.add(:email, :invalid)
    end
  end
end

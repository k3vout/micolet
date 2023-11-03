class User < ApplicationRecord
  # ASSOCIATIONS
  has_one :user_preference, dependent: :destroy
  accepts_nested_attributes_for :user_preference

  # VALIDATIONS
  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validate :email_exists_in_abstract

  private

  def email_exists_in_abstract
    unless EmailValidatorService.new(email: email).valid?
      errors.add(:email, :invalid)
    end
  end

  def send_subscription_email
    SubscriptionMailer.confirmation(self).deliver_now
  end
end

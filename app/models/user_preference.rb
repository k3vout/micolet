class UserPreference < ApplicationRecord
  # ASSOCIATIONS
  belongs_to :user

  # VALIDATIONS
  validate :at_least_one_preference

  private

  def at_least_one_preference
    unless women_fashion || men_fashion || children_fashion
      errors.add(:base, :at_least_one_preference)
    end
  end
end

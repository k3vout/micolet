class SurveyResponse < ApplicationRecord
  # ASSOCIATIONS
  belongs_to :user
  belongs_to :survey
  has_many :answers, dependent: :destroy

  # VALIDATIONS
  validates :user, presence: true
  validates :survey, presence: true

  # ENUMS
  enum status: { pending: 0, completed: 1 }
end

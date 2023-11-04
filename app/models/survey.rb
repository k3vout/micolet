class Survey < ApplicationRecord
  # ASSOCIATIONS
  belongs_to :user
  has_many :questions, dependent: :destroy
  has_many :survey_responses, dependent: :destroy
  has_many :answers, through: :survey_responses

  # VALIDATIONS
  validates :name, presence: true
  validates :user, presence: true

  # ENUMS
  enum survey_type: { subscription: 0 }

  def first_question
    questions.find_by(position: 1)
  end
end

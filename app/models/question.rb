class Question < ApplicationRecord
  # ASSOCIATIONS
  belongs_to :survey
  has_many :answers, dependent: :destroy

  # VALIDATIONS
  validates :name, presence: true
  validates :position, presence: true, uniqueness: { scope: :survey_id }

  def next_question
    survey.questions
          .where('questions.position > ?', position)
          .first
  end
end

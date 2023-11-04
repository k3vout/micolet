class Answer < ApplicationRecord
  # ASSOCIATIONS
  belongs_to :question
  belongs_to :survey_response

  # VALIDATIONS
  validates :question, presence: true
  validates :content, presence: true
  validates :survey_response, presence: true
  validates :survey_response_id, uniqueness: { scope: :question_id }
end

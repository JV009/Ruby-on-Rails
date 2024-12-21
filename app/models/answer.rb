class Answer < ApplicationRecord
  belongs_to :question

  validates :body, presence: true
  validate :validate_4_answers, on: :create

  scope :correct, -> { where(correct: true) }

  def validate_4_answers
    if question.answers.size > 4
      errors.add(:question, "should have between 1 and 4 answers") if question.answers.count > 4
    end
  end
end

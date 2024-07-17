class Answer < ApplicationRecord
  belongs_to :question

  validates :body, presence: true
  validates :validate_4_answers

  scope :correct, -> { where (correct: true) }

  def validate_4_answers
    if question.answers.size > 4
      errors.add(:quantity, "No more than 4 answers per question!")
    end
  end
end

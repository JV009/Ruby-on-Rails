class TestPassage < ApplicationRecord
  belongs_to :user
  belongs_to :test
  belongs_to :current_question, class_name: 'Question', optional: true

  before_validation :before_validation_set_question, only: %i[create update]

  SUCCESS_RATE = 85

  def complited?
    current_question.nil?
  end

  def accept!(answer_ids)
    if answer_ids.blank?
      errors.add(:base, "Please, select answer.")
      return false
    end
    if correct_answer?(answer_ids)
      self.correct_quesstions += 1
    end
    save!
  end

  def test_passed?
    (correct_questions.to_f / test.questions.count * 100).round(2) >= SUCCESS_RATE
  end

  def number_of_question
    self.test.questions.index(current_question) + 1  / test.questions.count
  end

  private

  def before_validation_set_question
    if test.present? && test.questions.any?
      self.current_question = test.questions.first if current_question.nil?
    else
      errors.add(:base, "Sorry, this test has no questions yet.")
    end
  end

  def correct_answer?(answer_ids)
    !answer_ids.nil? && correct_answers.ids.sort == answer_ids.map(&:to_i).sort
  end

  def correct_answers
    current_question.answers.correct
  end

  def next_question
    test.questions.order(:id).where('id > ?', current_question.id).first
  end
end

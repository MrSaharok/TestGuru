class TestPassing < ApplicationRecord
  belongs_to :user
  belongs_to :test
  belongs_to :current_question, class_name: 'Question', optional: true

  SUCCESS_RATE = 85

  before_validation :before_validation_set_question, on: %i[create update]

  def completed?
    current_question.nil?
  end

  def accept!(answer_ids)
    self.correct_questions += 1 if correct_answer?(answer_ids)
    save!
  end

  def success?
    result >= SUCCESS_RATE
  end

  def result
    (correct_questions * 100 / test.total_correct_answers_count).round
  end

  def current_question_number
    test.questions.order(:id).where('id < ?', current_question.id).size + 1
  end

  private

  def before_validation_set_question
    self.current_question =
      if new_record?
        test.questions.first
      else
        test.questions.order(:id).where('id > ?', current_question.id).first
      end
  end

  def correct_answer?(answer_ids)
    correct_answers.ids.sort == answer_ids.reject(&:empty?).map(&:to_i).sort
  end

  def correct_answers
    current_question.answers.correct
  end
end

class TestPassage < ApplicationRecord
  TEST_LIMIT = 85

  belongs_to :user
  belongs_to :test
  belongs_to :current_question, class_name: 'Question', optional: true

  before_validation :before_validation_set_first_question, on: :create
  before_update :before_update_set_next_question

  def complited?
    current_question.nil?
  end

  def accept!(answer_ids)
    self.correct_questions += 1 if correct_answer?(answer_ids)
    save!
  end

  def total_test_questions
    test.questions.count
  end

  def current_question_position
    self.test.questions.index(current_question) + 1
  end

  def result_test
    correct_questions.to_f * 100 / total_test_questions
  end

  def color
    if success?
      'success'
    else
      'fail'
    end
  end

  def success?
    result_test >= TEST_LIMIT
  end

  private

  def before_validation_set_first_question
    self.current_question = test.questions.first if test.present?
  end

  def correct_answer?(answer_ids)
    correct_answers.ids.sort == Array(answer_ids).map(&:to_i).sort
  end

  def correct_answers
    current_question.answers.correct
  end

  def before_update_set_next_question
    next_question = test.questions.order(:id).where('id > ?', current_question.id).first
    self.current_question = next_question
  end
end

class Answer < ApplicationRecord
  belongs_to :question

  validates :text, presence: true
  validate :validate_length, on: :create

  scope :correct, -> { where(correct: true) }

  def validate_length
    if question.answers.count >= 4
      puts "Число ответов не может быть выше 4"
      errors.add(:question)
    end
  end
end

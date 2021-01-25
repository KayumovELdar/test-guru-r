class Answer < ApplicationRecord
  belongs_to :question

  scope :correct, -> { where(correct: true) }

  validates :text, presence: true
  validate :validate_length, on: :create

  def validate_length
    errors.add(:question) if question.answers.count >= 4
  end
end

class User < ApplicationRecord
  has_many :authored_tests, class_name: 'Test', foreign_key: :author_id, dependent: :nullify
  has_many :user_tests, dependent: :destroy
  has_many :tests, through: :user_tests

  validates :name, presence: true

  def test_by_level(level)
    tests.where(level: level)
  end
end

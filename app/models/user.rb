# frozen_string_literal: true

class User < ApplicationRecord
  has_many :tests_own, class_name: 'Test', foreign_key: :author_id, dependent: :destroy
  has_many :user_tests
  has_many :tests, through: :user_tests, dependent: :destroy

  validates :name, presence: true

  def passing_test_levet(level_test)
    Test.joins(:user_tests)
        .where(level: level_test)
        .where(user_tests: { user_id: id })
  end
end

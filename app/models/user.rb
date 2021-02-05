class User < ApplicationRecord
  has_many :authored_tests, class_name: 'Test', foreign_key: :author_id, dependent: :nullify
  has_many :user_tests, dependent: :destroy
  has_many :tests, through: :user_tests

  validates :name, presence: true

  def passing_test_levet(level_test)
    Test.joins(:user_tests)
        .where(level:level_test)
        .where(user_tests: {user_id: id})
  end
end

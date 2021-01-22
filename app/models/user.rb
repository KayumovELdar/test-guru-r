class User < ApplicationRecord

  has_many :tests, foreign_key: :author_id, dependent: :destroy
  has_many :tests_users
  has_many :tests, through: :tests_users, dependent: :destroy

  def passing_test_levet(level_test)
    Test.joins('JOIN user_test ON user_test.test_id=tests.id')
        .where(tests: {level:level_test})
        .where(user_test: {user_id:id})
  end
end

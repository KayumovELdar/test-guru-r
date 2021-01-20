class User < ApplicationRecord

  def passing_test_levet(level_test)
    Test.joins('JOIN base_user_test ON base_user_test.test_id=tests.id').where("tests.level = ? ", level_test).where("base_user_test.user_id = ?", id)
  end
end

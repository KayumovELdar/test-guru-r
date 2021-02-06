class UserTest < ApplicationRecord
  belongs_to :test
  belongs_to :passed_test, class_name: "Test", foreign_key: 'test_id'
end

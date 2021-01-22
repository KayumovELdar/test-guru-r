class UserTest < ApplicationRecord
  belongs_to :user, index: true, foreign_key: true
  belongs_to :test, index: true, foreign_key: true
end

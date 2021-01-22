class Answer < ApplicationRecord
  belongs_to :question, index: true, foreign_key: true
end

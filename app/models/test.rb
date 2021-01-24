class Test < ApplicationRecord

  belongs_to :category
  belongs_to :author, class_name: 'User'
  has_many :questions, dependent: :destroy
  has_many :user_tests
  has_many :users, through: :user_tests, dependent: :destroy

  def self.from_category(category_name)
    joins(:category)
    .where(categories: { name: category_name })
    .order(name: :desc)
    .pluck(:name)
  end
end

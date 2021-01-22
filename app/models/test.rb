class Test < ApplicationRecord

  belongs_to :category, index: true, foreign_key: true
  belongs_to :author, class_name: :User, index: true, foreign_key: true
  has_many :questions, dependent: :destroy
  has_many :tests_users
  has_many :users, through: :tests_users, dependent: :destroy

  def self.from_category(category_name)
    joins("JOIN categories ON categories.id =tests.category_id")
      .where("categories: {name: category_name}).order(id: :desc).pluck(:name)
  end
end

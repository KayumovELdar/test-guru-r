class Test < ApplicationRecord
  belongs_to :category
  belongs_to :author, class_name: 'User', foreign_key: :author_id

  has_many :questions, dependent: :destroy
  has_many :user_tests, dependent: :destroy
  has_many :users, through: :user_tests

  validates :name, :level, presence: true
  validates :level, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :name, uniqueness: { scope: :level, message: 'Тест с таким уровнем и именем уже существует' }

  scope :easy, -> { where(level: [0..1]) }
  scope :medium, -> { where(level: [2..4]) }
  scope :hard, -> { where(level: [5..Float::INFINITY]) }

  scope :of_category, ->(category) { joins(:category).where(categories: { name: category }).order(name: :desc) }

  def self.from_category(category)
    Test.of_category(category).pluck(:name)
  end
end

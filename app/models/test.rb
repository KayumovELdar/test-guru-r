class Test < ApplicationRecord

  belongs_to :category
  belongs_to :author, class_name: 'User'

  has_many :questions, dependent: :destroy
  has_many :user_tests
  has_many :users, through: :user_tests, dependent: :destroy

  validates :name, :level, presence: true
  validates :level, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :name, uniqueness: { scope: :level, message: 'Тест данного уровня сложности уже был создан' }

  scope :level_of_difficulty, ->(level) { where(level: level) }
  scope :easy, -> { level_of_difficulty(0..1) }
  scope :medium, -> { level_of_difficulty(2..4) }
  scope :hard, -> { level_of_difficulty(5..Float::INFINITY) }

  scope :of_category, ->(category) { joins(:category).where(categories: { name: category }).order(name: :desc) }

  def self.from_category(category)
    Test.of_category(category).pluck(:name)
  end
end

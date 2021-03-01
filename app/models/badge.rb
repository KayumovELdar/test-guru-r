class Badge < ApplicationRecord
  has_many :user_badges, dependent: :destroy
  has_many :users, through: :user_badges

  enum rule_type: { first_try: 0, all_by_category: 1, all_by_level: 2 }

  validates :name, :image_url,:rule_type , presence: true
  validates :rule_type, presence: true, inclusion: { in: rule_types.keys }
  validate :valid_rule_value

  private

  def valid_rule_value
    case rule_type
    when "first_try"
      tests = Test.all.pluck(:id)
      if !rule_value.to_i.in?(tests)
        errors.add(:test, "Недопустимый идентификатор теста.")
      end
    when "all_by_level"
      levels = Test.distinct.pluck(:level).map(&:to_s)
      if !rule_value.in?(levels)
        errors.add(:level, "Недопустимый идентификатор уровня сложности.")
      end
    when "all_by_category"
      categories = Category.all.pluck(:id).map(&:to_s)
      if !rule_value.in?(categories)
        errors.add(:category, "Недопустимый идентификатор категории.")
      end
    end
  end
end

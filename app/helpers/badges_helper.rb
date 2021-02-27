module BadgesHelper
  def show_rule(badge)
    case badge.rule_type
    when "on_the_first_try"
      "Прохождение теста с первого раза #{badge.rule_value}"
    when "all_by_category"
      "Категория закрыта #{badge.rule_value} "
    when "all_by_level"
      "Все теста данной сложности пройдены #{badge.rule_value} "
    end
  end
end

module BadgesHelper
  def show_rule(badge)
    case badge.rule_type
    when "first_try"
      I18n.t('helpers.bages_helper.first_try', rule_value: badge.rule_value)
    when "all_by_category"
      I18n.t('helpers.bages_helper.category', rule_value: badge.rule_value)
    when "all_by_level"
      I18n.t('helpers.bages_helper.level', rule_value: badge.rule_value)
    end
  end
end

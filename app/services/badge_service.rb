class BadgeService

  def initialize(test_passage)
    @test_passage = test_passage
    @user = test_passage.user
    @test = test_passage.test
    @rewarded_badges = []
  end

  def call
    Badge.select do |badge| send("#{badge.rule_type}", @badge = badge)}
  end

  private

  def first_try
    if @test.id.in?(Badge.on_the_first_try.pluck(:rule_value).map(&:to_i))
      if !@user.has_failed_passing?(@test) && !@user.badges.include?(@badge)
        @rewarded_badges << @badge
      end
    end
  end

  def all_by_category
    category = Category.find(@badge.rule_value)
    all_tests_by_category = Test.where('category_id = ?', category.id)
    if (all_tests_by_category - succesfully_passed_tests) == []
      @rewarded_badges << @badge
    end
  end

  def all_by_level(badge)
    level = @badge.rule_value
    all_tests_by_level = Test.where('level = ?', level)
    if (all_tests_by_level - succesfully_passed_tests) == []
      @rewarded_badges << @badge
    end
  end
end

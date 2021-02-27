class BadgeService

  def initialize(test_passage)
    @test_passage = test_passage
    @user = test_passage.user
    @test = test_passage.test
    @test_passages = @user.test_passages
  end

    def success_category?(badge)
    end

    def success_all_level?(badge)
    end

    def success_on_first_try?(badge)
    end
end

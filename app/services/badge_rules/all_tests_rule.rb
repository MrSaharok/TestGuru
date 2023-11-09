module BadgeRules
  class AllTestsRule < BaseRule
    def criteria?
      success_tests = @test_passing.user.test_passings.order(:test_id).pluck(:test_id).uniq
      Test.all.order(:id).pluck(:id) == success_tests
    end
  end
end

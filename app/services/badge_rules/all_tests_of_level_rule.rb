module BadgeRules
  class AllTestsOfLevelRule < BaseRule
    def criteria?
      return false if @rule_options.to_i != @test_passing.test.level

      tests_of_level = Test.where(level: @rule_options.to_i).order(:id).pluck(:id)
      passed_tests_of_level = TestPassing.where(user: @test_passing.user, tests: tests_of_level)
                                         .order(:test_id)
                                         .select(&:success?)
                                         .pluck(:test_id)
                                         .uniq
      passed_tests_of_level == tests_of_level
    end
  end
end

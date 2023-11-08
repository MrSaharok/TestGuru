module BadgeRules
  class AllTestsOfCategoryRule < BaseRule
    def criteria?
      category = @test_passing.test.category
      return false unless Category.find_by(title: @rule_options) == category

      category_tests = category.tests.order(:id).pluck(:id)
      user_tests = TestPassing.where(user: @test_passing.user, tests: category.tests)
                              .order(:test_id)
                              .select(&:success?)
                              .pluck(:test_id)
                              .uniq
      category_tests == user_tests
    end
  end
end

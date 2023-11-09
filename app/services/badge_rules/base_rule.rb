module BadgeRules
  class BaseRule
    def initialize(passing, badge)
      @test_passing = passing
      @rule_options = badge.rule_options
    end
  end
end

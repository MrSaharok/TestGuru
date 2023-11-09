class BadgeService

  RULES = {
    all_tests_of_category:  BadgeRules::AllTestsOfCategoryRule,
    at_first_try:           BadgeRules::AtFirstTryRule,
    all_tests_of_level:     BadgeRules::AllTestsOfLevelRule,
    all_tests:              BadgeRules::AllTestsRule,
  }

  attr_reader :new_badges

  def initialize(passing)
    @test_passing = passing
    @new_badges = false
  end

  def reward_search
    Badge.all.each do |badge|
      rule = RULES[badge.rule.text.to_sym]
      reward(badge) if rule.new(@test_passing, badge).criteria?
    end
    self
  end

  private

  def reward(badge)
    @test_passing.user.badges << badge
    @new_badges = true
  end
end

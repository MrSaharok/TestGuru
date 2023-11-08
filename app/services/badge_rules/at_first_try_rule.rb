module BadgeRules
  class AtFirstTryRule < BaseRule
    def criteria?
      @test_passing.success? && @test_passing.user.test_passings.where(test: @test_passing.test).count == 1
    end
  end
end

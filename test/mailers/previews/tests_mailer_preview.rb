class TestsMailerPreview < ActionMailer::Preview

  def completed_test
    test_passing = TestPassing.new(user: User.first, test: Test.first)

    TestsMailer.completed_test(test_passing)
  end
end

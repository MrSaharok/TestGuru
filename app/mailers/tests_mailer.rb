class TestsMailer < ApplicationMailer
  def completed_test(test_passing)
    @user = test_passing.user
    @test_passing = test_passing

    mail to: @user.email, subject: t('completed_test', test: @test_passing.test.title)
  end
end

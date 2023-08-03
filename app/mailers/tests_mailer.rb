class TestsMailer < ApplicationMailer

  def completed_test(test_passing)
    @user = test_passing.user
    @test = test_passing.test

    mail to: @user.email,subject: t('test_complited', test: @test_passing.test.title)
  end
end

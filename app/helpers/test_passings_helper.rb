module TestPassingsHelper

  def current_question_on_test
  @test_passing.test.questions.index(@test_passing.current_question) + 1
  end
end

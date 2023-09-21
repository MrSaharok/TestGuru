module TestPassingsHelper
  def current_progress_percents
    @test_passing.current_question_number / @test_passing.test.questions.size.to_f * 100
  end
end

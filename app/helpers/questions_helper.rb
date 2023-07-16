module QuestionsHelper
  def question_header(question)
    if question.persisted?
      "Edit question for #{@question.test.title}"
    else
      "New question in #{@test.title}"
    end
  end
end

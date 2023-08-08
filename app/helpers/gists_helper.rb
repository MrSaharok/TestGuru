module GistsHelper
  def body_question(question_text)
    "#{question_text.slice(0, 25)}..."
  end
end

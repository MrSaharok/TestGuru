module GistsHelper
  def truncate(question_text)
    "#{question_text.slice(0, 25)}..."
  end
end

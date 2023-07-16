class QuestionsController < ApplicationController

  before_action :find_test, only: %i[index new create]
  before_action :find_question, only: %i[show destroy]

  rescue_from ActiveRecord::RecordNotFound, with: :question_not_found

  def index
  end

  def show
  end

  def new
    @question = @test.questions.new
  end

  def create
    question = @test.questions.new(question_params)
    if question.save
      redirect_to question_path(question.id)
    else
      render :new
    end
  end

  def destroy
    @question.destroy
    render plain: 'Text deleted'
  end

  private

  def question_params
    params.require(:question).permit(:body)
  end

  def find_test
    @test = Test.find(params[:test_id])
  end

  def find_question
    @question = Question.find(params[:id])
  end

  def question_not_found
    render plain: 'The question was not found'
  end
end

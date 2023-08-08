class TestPassingsController < ApplicationController

  before_action :authenticate_user!
  before_action :set_test_passing, only: %i[show update result gist]

  def show; end

  def result; end

  def gist
    result = GistQuestionService.new(@test_passing.current_question).call

    flash_options = if result.success?
                      Gist.create!(
                        author_email: current_user.email,
                        github_url: result.url,
                        question: @test_passing.current_question
                      )
                      { notice: t('.success') }
                    else
                      { alert: t('.failure') }
                    end

    redirect_to @test_passing, flash_options
  end

  def update
    @test_passing.accept!(params[:answer_ids])
     if @test_passing.completed?
       TestsMailer.completed_test(@test_passing).deliver_now
       redirect_to result_test_passing_path(@test_passing), notice: t('.test_completed')
     else
       render :show
     end
  end

  private

  def set_test_passing
    @test_passing = TestPassing.find(params[:id])
  end
end

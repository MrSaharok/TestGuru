class GistsController < ApplicationController

  def create
    @test_passing = TestPassing.find(params[:test_passing_id])
    result = GistQuestionService.new(@test_passing.current_question).call

    flash_options = if result.success?
                      Gist.create!(
                        author_email: current_user.email,
                        github_url: result.url,
                        question: @test_passing.current_question
                      )
                      { notice: t('.success', link: view_context.link_to(t('.link'), result.url, target: '_blank')) }
                    else
                      { alert: t('.failure') }
                    end

    redirect_to @test_passing, flash_options
  end
end

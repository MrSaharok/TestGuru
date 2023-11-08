class TestPassingsController < ApplicationController
  before_action :set_test_passing, only: %i[show result update]

  def show
    if @test_passing.completed?
      redirect_to tests_path, notice: t('.already_completed')
    else
      set_timer_cookie
    end
  end

  def result; end

  def update
    @test_passing.accept!(params[:answer_ids])
    if @test_passing.completed?
      check_for_badges
      redirect_to result_test_passing_path(@test_passing), notice: t('.test_completed')
    else
      render :show
    end
  end

  private

  def set_test_passing
    @test_passing = TestPassing.find(params[:id])
  end

  def set_timer_cookie
    cookies[:time_to_finish] = @test_passing.time_to_finish
  end

  def check_for_badges
    new_badge = BadgeService.new(@test_passing).reward_search.new_badges
    flash[:success] = t('.new_badge_received') if new_badge
  end
end

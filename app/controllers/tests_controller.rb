class TestsController < ApplicationController

  before_action :find_test, only: %i[start]

  def index
    @tests = Test.all
  end

  def start
    current_user.tests.push(@test)
    redirect_to current_user.test_passing(@test), notice: t('.start')
  end
end

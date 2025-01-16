class TestsController < ApplicationController

  def index
    @tests = Test.where(active: true)
  end

  def start
    @test = Test.find(params[:id])

    current_user.tests.push(@test)
    redirect_to current_user.test_passage(@test)
  end
end

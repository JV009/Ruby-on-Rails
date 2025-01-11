class TestsController < ApplicationController

  def index
    @tests = Test.includes(:questions).where.not(questions: { id: nil }) || Test.includes(:answers).where.not(answers: { id: nil })
  end

  def start
    @test = Test.find(params[:id])

    current_user.tests.push(@test)
    redirect_to current_user.test_passage(@test)
  end
end

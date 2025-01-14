class TestPassagesController < ApplicationController

  before_action :set_test_passage, only: %i[show result update]

  def show
  end

  def result
  end

  def update
    @test_passage.accept!(params[:answer_ids])

    if @test_passage.complited?
      BadgeService.new(current_user).give_badges(@test_passage.test)
      TestsMailer.completed_test(@test_passage).deliver_now
      redirect_to result_test_passage_path(@test_passage)
    else
      flash.now[:alert] = @test_passage.errors.full_messages.to_sentence
      redirect_to test_passage_path
    end
  end

  private

  def set_test_passage
    @test_passage = TestPassage.find(params[:id])
    if @test_passage.test.questions.empty?
      flash[:alert] = "Sorry, this test has no questions yet."
      redirect_to tests_path
    end
  end
end

class GistsController < ApplicationController

  before_action :set_test_passage, only: %i[create]

  def create
    result = GistQuestionService.new(@test_passage.current_question).call

    flash_options = if result.status == 201
      current_user.gists.create(question: @test_passage.current_question, url: result.html_url)
      { notice: t('.success')
    else
      { alert: t('.failure')}
    end

    redirect_to @test_passage, flash_options
  end

  private

  def set_test_passage
    @test_passage = TestPassage.find(params[:id])
  end
end

class QuestionsController < ApplicationController

  before_action :find_question, only: %i[ show ]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_find

  def show
  end

  private

  def find_question
    @question = Question.find(params[:id])
  end

  def rescue_with_question_not_find
    render plain: 'The question was not found!'
  end
end

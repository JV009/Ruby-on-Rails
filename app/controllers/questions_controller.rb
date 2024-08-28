class QuestionsController < ApplicationController

  before_action :find_test, only: %i[index create]
  before_action :find_question, only: %i[show destroy]

  rescue_from ActiveRecord::RecordNotFound, With: :rescue_with_question_not_find

  def index
    @questions = @test.questions
    render plain: @questions.map(&:body).join("\n")
  end

  def show
    render plain: @question.body
  end

  def new
  end

  def create
    @question = @test.questions.create(question_params)
    if @question.save
      render plain: 'The question created!'
    else
      render plain: 'The question was not created!'
    end
  end

  def destroy
    @question.destroy
    render plain: 'The question deleted!'
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

  def rescue_with_question_not_find
    render plain: 'The question was not found!'
  end
end

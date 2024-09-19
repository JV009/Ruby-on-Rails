class QuestionsController < ApplicationController

  before_action :find_test, only: %i[ new create ]
  before_action :find_question, only: %i[ show destroy edit update ]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_find

  def show
  end

  def new
    @question = @test.question.new
  end

  def create
    @question = @test.questions.new(question_params)
    if @question.save
      redirect_to @test
    else
      render plain: 'The question was not created!'
    end
  end

  def destroy
    @question.destroy
    redirect_to tests_path(@question.test)
  end

  def edit
  end

  def update
     if @question.update(question_params)
       redirect_to test_path(@question.test)
     else
       render :edit
     end
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

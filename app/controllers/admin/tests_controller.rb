class Admin::TestsController < Admin::BaseController

  before_action :set_tests, only: %i[index update_inline]
  before_action :find_test, only: %i[show destroy edit update update_inline]

  def index
  end

  def show
  end

  def new
    @test = Test.new
  end

  def create
    @test = current_user.author_tests.new(test_params)
    if @test.save
      redirect_to [:admin, @test], notice: t(".success")
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @test.update(test_params)
      redirect_to [:admin, @test]
    else
      render :edit
    end
  end

  def update_inline
    if @test.update(test_params)
      redirect_to admin_tests_path
    else
      render :index
    end
  end

  def destroy
    if @test.destroy
      redirect_to admin_tests_path, notice: t(".success")
    else
      redirect_to admin_tests_path, alert: t(".cannot_destroy")
    end
  end


private

  def test_params
    params.require(:test).permit(:title, :level, :category_id, :active, :timer)
  end

  def find_test
    @test = Test.find(params[:id])
  end

  def set_tests
    @tests = Test.all
  end
end

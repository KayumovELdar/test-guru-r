  require_ralative 'Questions_controller'

class TestsController < ApplicationController

  require_ralative 'Questions_controller'
  before_action :find_test, only: %i[show edit update destroy]
  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_test_not_found
  def index
    @tests = Test.all
  end

  def show
  end

  def new
    @test = Test.new
  end

  def create
    @test = Test.new(test_params)
    if @test.save
      redirect_to @test
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @test.update(test_params)
      redirect_to @test
    else
      render :edit
    end
  end

  def destroy
    @test.destroy
    redirect_to root_path
  end

  private


    def test_params
      params.require(:test).permit(:level, :name, :category)
    end

    def rescue_with_test_not_found
    render plain: 'Test was not found!'
    end
end

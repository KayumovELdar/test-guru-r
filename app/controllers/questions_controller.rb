class QuestionsController < ApplicationController
  before_action :find_test, only: %i[index create new destroy]
  before_action :find_question, only: %i[show destroy]

  rescue_from ActiveRecord::RecordNotFound, with: :resque_with_test_not_found

  def index
      render html: @test.questions
  end

  def show;end

  def new;end

  def create
    @question = @test.questions.new(question_params)
      if @question.save
        redirect_to test_questions_path(@test)
      else
        render :new
      end
  end

  def destroy
    @questioт.destroy
    render html: "Вопрос удалён!"
  end

  private

  def question_params
    params.require(:question).permit(:text)
  end

  def find_question
   @question = Question.find(params[:id])
  end

  def find_test
    @test = Test.find(params[:id])
  end

  def resque_with_test_not_found
    render html: 'Пусто'
  end
end

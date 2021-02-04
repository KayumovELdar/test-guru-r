class QuestionsController < ApplicationController
  before_action :find_test, only: %i[index create new destroy]
  before_action :find_question, only: %i[show destroy edit]

  rescue_from ActiveRecord::RecordNotFound, with: :resque_with_test_not_found

  def index
      render html: @test.questions
  end

  def show;end

  def new
    @question = Questions.new
  end

  def create
    @question = @test.questions.new(question_params)
      if @question.save
        redirect_to @question
      else
        render :new
      end
  end

  def edit
  end

  def updale
      if @question.update(question_params)
        redirect_to @question
      else
        render :edit
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

  def resque_with_test_not_found
    render html: 'Пусто'
  end
end

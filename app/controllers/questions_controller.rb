# frozen_string_literal: true

class QuestionsController < ApplicationController
  before_action :find_test, only: %i[index create new]
  before_action :find_question, only: %i[show destroy edit update]

  rescue_from ActiveRecord::RecordNotFound, with: :resque_with_test_not_found

  def show; end

  def new
    @question = @test.questions.new
  end

  def create
    @question = @test.questions.new(question_params)
    if @question.save
      redirect_to @question
    else
      render :new
    end
  end

  def edit; end

  def updale
    if @question.update(question_params)
      redirect_to @question
    else
      render :edit
    end
  end

  def destroy
    @questioт.destroy
    render html: 'Вопрос удалён!'
  end

  private

  def question_params
    params.require(:question).permit(:text)
  end

  def find_test
    @test = Test.find(params[:id])
  end

  def find_question
    @question = @test.questions.find(params[:id])
  end

  def resque_with_test_not_found
    render html: 'Пусто'
  end
end

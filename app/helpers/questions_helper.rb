# frozen_string_literal: true

module QuestionsHelper

  def question_header(question)
    if question.persisted?
      'Редактировать вопрос'
    else
      'Создать новый вопрос'
    end
  end
end

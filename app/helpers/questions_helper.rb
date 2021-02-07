module QuestionsHelper
  def question_header(question)
    if question.persisted?
      "Редактировать вопрос #{question.text}"
    else
      'Создать новый вопрос'
    end

  end
  
end

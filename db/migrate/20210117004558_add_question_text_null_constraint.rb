class AddQuestionTextNullConstraint < ActiveRecord::Migration[6.1]
  def change
      change_column_null(:questions, :text, false)
  end
end

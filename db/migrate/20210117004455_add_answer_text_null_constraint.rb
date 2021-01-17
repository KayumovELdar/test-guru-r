class AddAnswerTextNullConstraint < ActiveRecord::Migration[6.1]
  def change
    change_column_null(:answers, :text, false)
  end
end

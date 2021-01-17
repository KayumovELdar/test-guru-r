class CreateAnswers < ActiveRecord::Migration[6.1]
  def change
    create_table :answers do |t|
      t.string :text
      t.boolean :correct, default: false, null: false

      t.timestamps
    end
  end
end

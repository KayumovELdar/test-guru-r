class AddSuccessedToTestPassage < ActiveRecord::Migration[6.1]
  def change
    add_column :test_passages, :successed, :boolean, default: false
  end
end

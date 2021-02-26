class AddTimerTestToTests < ActiveRecord::Migration[6.1]
  def change
    add_column :tests, :timer_test, :integer, default: 15
  end
end

class CreateBaseUserTests < ActiveRecord::Migration[6.1]
  def change
    create_table :base_user_tests do |t|

      t.timestamps
    end
  end
end

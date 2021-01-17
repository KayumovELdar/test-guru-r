class CreateTests < ActiveRecord::Migration[6.1]
  def change
    create_table :tests do |t|
      t.integer :level, default: 0, null: false
      t.string :name, null: false
      t.references :category, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end

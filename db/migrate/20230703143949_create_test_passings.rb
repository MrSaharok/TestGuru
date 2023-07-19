class CreateTestPassings < ActiveRecord::Migration[6.1]
  def change
    create_table :test_passings do |t|
      t.references :user, foreign_key: true, null: false
      t.references :test, foreign_key: true, null: false
      t.references :question, foreign_key: true, null: false
      t.integer :correct_questions, default: 0
    end
  end
end

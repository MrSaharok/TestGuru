class CreateTestPassings < ActiveRecord::Migration[7.0]
  def change
    create_table :test_passings do |t|
      t.references :user, foreign_key: true
      t.references :test, foreign_key: true
      t.references :current_question, foreign_key: { to_table: :questions }

      t.timestamps
    end
  end
end

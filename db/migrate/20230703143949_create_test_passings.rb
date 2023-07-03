class CreateTestPassings < ActiveRecord::Migration[6.0]
  def change
    create_table :test_passings do |t|
      t.references :user, foreign_key: true, null: false
      t.references :test, foreign_key: true, null: false
      t.references :current_question, foreign_key: { to_table: :questions }, null: false
      t.string :status, null: false

      t.timestamps
    end
  end
end

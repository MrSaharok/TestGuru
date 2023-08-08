class CreateGists < ActiveRecord::Migration[6.1]
  def change
    create_table :gists do |t|
      t.string :github_url
      t.string :author_email
      t.references :question, foreign_key: true, null: false

      t.timestamps
    end
  end
end

class CreateBadges < ActiveRecord::Migration[6.1]
  enable_extension 'hstore' unless extension_enabled?('hstore')

  def change
    add_column :test_passings, :completed_at, :datetime

    create_table :rules do |t|
      t.string :text, null: false, index: { unique: true }
      t.string :option_key

      t.timestamps
    end

    create_table :images do |t|
      t.string :url, null: false

      t.timestamps
    end

    create_table :badges do |t|
      t.string :name, null: false, unique: true
      t.string :description, null: false
      t.string :rule_options
      t.references :rule, null: false, foreign_key: true
      t.references :image, null: false, foreign_key: true

      t.timestamps
    end

    create_table :users_badges do |t|
      t.references :user, null: false, foreign_key: true
      t.references :badge, null: false, foreign_key: true

      t.timestamps
    end
  end
end

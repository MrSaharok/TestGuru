class Test < ApplicationRecord
  has_many :test_passings
  has_many :users, through: :test_passings

  scope :sort_categories, ->(category) {
    joins(:category)
      .where(categories: { title: category })
      .order(title: :desc)
  }

  def self.sort_by_categories(category)
    sort_categories(category).pluck(:title)
  end
end

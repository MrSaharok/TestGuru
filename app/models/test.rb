class Test < ApplicationRecord
  has_many :test_passages
  has_many :users, through: :test_passages

  scope :sort_categories, ->(category) {
    joins(:category)
      .where(categories: { title: category })
      .order(title: :desc)
  }

  def self.sort_by_categories(category)
    sort_categories(category).pluck(:title)
  end
end

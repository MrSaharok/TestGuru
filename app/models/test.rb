class Test < ApplicationRecord
  scope :sort_categories, ->(category) {
    joins(:category)
      .where(categories: { title: category })
      .order(title: :desc)
  }

  def self.sort_by_categories(category)
    sort_categories(category).pluck(:title)
  end
end

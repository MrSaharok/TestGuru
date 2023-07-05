class Test < ApplicationRecord

  def self.sort_by_categories(category)
    sort_categories = Category.where(title: category)
    Test.where(category_id: sort_categories).order('title desc')
  end
end

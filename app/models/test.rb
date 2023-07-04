class Test < ApplicationRecord

  def self.sort_by_categories(category)
    Category.where(categories: { title: category }).order('id desc')
  end
end
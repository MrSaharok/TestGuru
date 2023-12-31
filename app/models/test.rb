class Test < ApplicationRecord
  belongs_to :category
  belongs_to :author, class_name: 'User', foreign_key: :author_id

  has_many :questions, dependent: :destroy
  has_many :test_passings, dependent: :destroy
  has_many :users, through: :test_passings, dependent: :destroy

  validates :title, presence: true, uniqueness: { scope: :level }
  validates :level, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  scope :easy, -> { where(level: 0..1) }
  scope :medium, -> { where(level: 2..4) }
  scope :hard, -> { where(level: 5..Float::INFINITY) }

  scope :find_by_category_tests, lambda { |name|
                                   joins(:category)
                                     .where(categories: { title: name })
                                     .order(title: :desc)
                                 }
  def self.sort_by_category_name(name)
    find_by_category_tests(name).pluck(:title)
  end

  def total_correct_answers_count
    Test.joins(questions: :answers).where(id:, answers: { correct: true }).count
  end
end

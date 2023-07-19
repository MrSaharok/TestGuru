class User < ApplicationRecord
  has_many :authored_tests, class_name: 'Test', foreign_key: :author_id
  has_many :test_passings, dependent: :destroy
  has_many :tests, through: :test_passings, dependent: :destroy

  validates :email, presence: true

  def test_by_level(level)
    tests.where(level: level)
  end

  def test_passing(test)
    test_passings.order(id: :desc).find_by(test_id: test.id)
  end
end

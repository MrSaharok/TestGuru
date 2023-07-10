class User < ApplicationRecord
  has_many :authored_tests, class_name: 'Test', foreign_key: :author_id
  has_many :test_passings, dependent: :destroy
  has_many :tests, through: :test_passings, dependent: :destroy


  def test_by_level(level)
    tests.where(level: level)
  end
end


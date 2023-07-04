class User < ApplicationRecord
  has_many :test_passings
  has_many :tests, through: :test_passings

  def test_by_level(level)
    tests.where(level: level)
  end
end

class User < ApplicationRecord
  def test_by_level(level)
    tests.where(level: level)
  end

  def test_passing(test)
    test_passings.order(id: :desc).find_by(test: test)
  end
end

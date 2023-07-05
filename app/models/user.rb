class User < ApplicationRecord

  def test_by_level(level)
    test_level = TestPassing.where(user_id: id).pluck(:test_id)
    Test.where(id: test_level, level: level)
  end
end

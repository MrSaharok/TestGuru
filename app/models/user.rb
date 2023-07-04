class User < ApplicationRecord

  def test_by_level(level)
    TestPassing.where(user_id: self.id).where.not(status: 'Not started').map do | tp |
      Test.where(id: tp.test_id, level: level)
    end.flatten
  end
end
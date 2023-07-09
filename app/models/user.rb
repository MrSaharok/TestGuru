class User < ApplicationRecord

  def test_by_level(level)
    Test.joins('JOIN test_passings ON test_passings.test_id = tests.id')
        .where(test_passings: { user_id: id }, level: level)
  end
end


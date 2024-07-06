class User < ApplicationRecord
  def tests_level(level)
    Test.joins('left join user_tests on user_tests.test_id = tests.id').where(level: level, user_tests: { user_id: self.id })
  end
end

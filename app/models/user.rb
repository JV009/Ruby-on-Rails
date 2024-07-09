class User < ApplicationRecord
  has_many :user_tests
  has_many :author_tests, class_name: 'Test', foreign_key: :author_id
  has_many :tests, through: :user_tests
  def tests_level(level)
    Test.joins('left join user_tests on user_tests.test_id = tests.id').where(level: level, user_tests: { user_id: self.id })
  end
end

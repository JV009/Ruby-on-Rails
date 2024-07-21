class User < ApplicationRecord
  has_many :user_tests
  has_many :author_tests, class_name: 'Test', foreign_key: :author_id
  has_many :tests, through: :user_tests

  validates :email, presence: true

  def tests_level(level)
    tests.where(level: level)
  end
end

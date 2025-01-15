class Badge < ApplicationRecord
  has_many :user_badges
  has_many :users, through: :user_badges

  validates :name, :image, :rule, presence: true

  RULES = {
    "Passing all tests from the category" => :all_category_of_tests_passed,
    "Passing the test on the first try" => :first_attempt,
    "Passing all tests of a certain level" => :level_tests_passed
  }.freeze
end

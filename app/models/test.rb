class Test < ApplicationRecord
  has_many :questions
  has_many :user_tests
  has_many :users, through: :user_tests
  belongs_to :author, class_name: 'User', foreign_key: :author_id
  belongs_to :category
  def self.tests_category(category_name)
    joins(:category).where(categories: {title: category_name}).order(id: :desc).pluck(:title)
    #Test.where(categories: {title: category_name}).order(id: :desc).pluck(:title)
    #Test.joins('left join categories on categories.id = tests.category_id').where(categories: {title: category_name}).order(id: :desc).pluck(:title)
  end
end

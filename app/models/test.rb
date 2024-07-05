class Test < ApplicationRecord
  def self.tests_category(category_name)
    Test.joins('left join categories on categories.id = tests.category_id').where(categories: {title: category_name}).order(id: :desc).pluck(:title)
  end
end

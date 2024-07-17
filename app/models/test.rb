class Test < ApplicationRecord
  has_many :questions
  has_many :user_tests
  has_many :users, through: :user_tests
  belongs_to :author, class_name: 'User', foreign_key: :author_id
  belongs_to :category

  validates :title, presence: true,
                    uniqueness: { scope: :level}
  validates :level, numericality: {only_integer: true, :greater_than_or_equal_to: 0}

  scope :easy, -> { where (level: 0..1) }
  scope :medium, -> { where (level: 2..4) }
  scope :hard, -> { where (level: 5..Float::INFINITY) }
  scope :from_category, -> (category_name) { joins(:category).where(categories: { title: category_name }) }

  def self.tests_category(category_name)
    from_category(category_name).order(id: :desc).pluck(:title)
  end
end

class Category < ApplicationRecord
  has_many :tests

  validates :title, presence: true

  scope :title, -> { order(title: asc) }
end

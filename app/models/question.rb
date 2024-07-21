class Question < ApplicationRecord
  has_many :answers
  belongs_to :tests

  validates :body, presence: true
end

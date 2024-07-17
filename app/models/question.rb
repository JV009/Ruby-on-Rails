class Question < ApplicationRecord
  has_many :answers
  belong_to :test

  validates :body, presence: true
end

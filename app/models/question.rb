class Question < ApplicationRecord
  has_many :answers
  belong_to :test
end

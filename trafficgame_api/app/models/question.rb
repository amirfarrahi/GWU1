class Question < ApplicationRecord
  has_many :answers
  has_many :nodequestions
  has_many :nodes, through: :nodequestions
end

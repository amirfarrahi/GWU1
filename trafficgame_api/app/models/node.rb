class Node < ApplicationRecord
  has_many :nodequestions
  has_many :question, through: :nodequestions
end

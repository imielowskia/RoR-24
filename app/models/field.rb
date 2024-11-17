class Field < ApplicationRecord
  has_many :groups
  has_many :students, through: :groups
end

class Group < ApplicationRecord
  has_many :students
  has_and_belongs_to_many :courses
  belongs_to :field
end
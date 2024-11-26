class Student < ApplicationRecord
  belongs_to :group
  has_many :grades
  has_many :courses, through: :grades
  has_many :detail_grades

  def IN
    imie+' '+nazwisko
  end

end

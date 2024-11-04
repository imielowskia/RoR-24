class Student < ApplicationRecord
  belongs_to :group

  def IN
    imie+' '+nazwisko
  end

end

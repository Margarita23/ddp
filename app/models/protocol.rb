class Protocol < ApplicationRecord
  belongs_to :student

  def teacher
    Teacher.all.find_by(id: teacher_id)
  end
end

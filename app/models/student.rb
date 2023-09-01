class Student < ApplicationRecord
  belongs_to :group
  belongs_to :teacher
  has_one :protocol, dependent: :destroy

  def get_teacher_lfp
    teacher = Teacher.find_by(id: self.teacher_id)
    return "#{ teacher.last_name } #{ teacher.first_name } #{ teacher.patronymic}"
  end

  # def lfp
  #   return "#{ student.last_name } #{ student.first_name } #{ student.patronymic}"
  # end

  def get_group
    group = Group.find_by(id: self.group_id)
    return group
  end
end

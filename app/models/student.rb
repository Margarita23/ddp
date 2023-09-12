class Student < ApplicationRecord
  belongs_to :group
  belongs_to :teacher
  has_one :protocol, dependent: :destroy
  has_one :diploma, class_name: "Diploma", dependent: :destroy
  # attr_accessor :diploma_id
  accepts_nested_attributes_for :diploma

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

  def commission_teachers
    commission_teacher_ids = Commission.all.find_by(id: group_id).teacher_ids
    teachers_array = Array.new
    
    commission_teacher_ids.each do |teacher_id|
      teachers_array.push(Teacher.all.find_by(id: teacher_id))
    end

    return teachers_array
  end

  def leader_teacher
    Teacher.find_by(id: teacher_id)
  end

  def leader_teacher_info
    teacher = leader_teacher
    return "#{ teacher.academic_status }, #{ teacher.position }, #{ teacher.lfp }"
  end
end

class AddTeacherRefToStudents < ActiveRecord::Migration[7.0]
  def change
    add_reference :students, :teacher, null: false, default: "", foreign_key: true
  end
end

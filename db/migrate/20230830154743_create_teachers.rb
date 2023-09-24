class CreateTeachers < ActiveRecord::Migration[7.0]
  def change
    create_table :teachers do |t|
      t.string :first_name
      t.string :last_name
      t.string :patronymic
      t.string :academic_status
      t.string :position

      t.timestamps
    end
  end
end

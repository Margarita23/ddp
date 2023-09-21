class CreateStudents < ActiveRecord::Migration[7.0]
  def change
    create_table :students do |t|
      t.string :full_name
      t.string :theme
      t.date :date
      t.string :gender, null: false
      t.references :group, null: false, foreign_key: true

      t.timestamps
    end
  end
end

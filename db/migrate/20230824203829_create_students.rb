class CreateStudents < ActiveRecord::Migration[7.0]
  def change
    create_table :students do |t|
      t.string :full_name
      t.string :theme
      t.string :leader
      t.date :date
      t.references :group, null: false, foreign_key: true

      t.timestamps
    end
  end
end
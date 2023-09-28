class CreateMarks < ActiveRecord::Migration[7.0]
  def change
    create_table :marks do |t|
      t.integer :teacher_id
      t.integer :mark
      t.references :diploma, null: false, foreign_key: true

      t.timestamps
    end
  end
end

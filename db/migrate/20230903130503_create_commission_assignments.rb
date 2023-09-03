class CreateCommissionAssignments < ActiveRecord::Migration[7.0]
  def change
    create_table :commission_assignments do |t|
      t.references :teacher, null: false, foreign_key: true
      t.references :commission, null: false, foreign_key: true

      t.timestamps
    end
  end
end

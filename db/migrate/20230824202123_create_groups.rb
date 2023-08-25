class CreateGroups < ActiveRecord::Migration[7.0]
  def change
    create_table :groups do |t|
      t.string :form
      t.string :specialization
      t.string :name_number
      t.integer :specialty_code
      t.references :defense_process, null: false, foreign_key: true

      t.timestamps
    end
  end
end

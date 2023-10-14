class CreateCriteria < ActiveRecord::Migration[7.0]
  def change
    create_table :criteria do |t|
      t.string :name
      t.references :eval_method, null: false, foreign_key: true
      t.references :expert, null: true, foreign_key: true, default: ""

      t.timestamps
    end
  end
end

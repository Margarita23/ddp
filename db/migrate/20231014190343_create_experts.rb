class CreateExperts < ActiveRecord::Migration[7.0]
  def change
    create_table :experts do |t|
      t.string :name
      t.references :eval_method, null: false, foreign_key: true

      t.timestamps
    end
  end
end

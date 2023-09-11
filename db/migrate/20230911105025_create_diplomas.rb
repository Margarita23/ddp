class CreateDiplomas < ActiveRecord::Migration[7.0]
  def change
    create_table :diplomas do |t|
      t.string :theme
      t.integer :pages
      t.integer :presentation
      t.string :language, null: false, default: "українською"
      t.references :student, null: false, foreign_key: true
      t.integer :mark
      t.string :sample_type

      t.timestamps
    end
  end
end

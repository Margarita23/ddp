class CreateProtocols < ActiveRecord::Migration[7.0]
  def change
    create_table :protocols do |t|
      t.references :student, index: true, foreign_key: true

      t.timestamps
    end
  end
end

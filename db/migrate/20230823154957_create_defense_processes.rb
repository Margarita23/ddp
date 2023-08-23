class CreateDefenseProcesses < ActiveRecord::Migration[7.0]
  def change
    create_table :defense_processes do |t|
      t.string :nameID

      t.timestamps
    end
  end
end

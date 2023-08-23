class AddForeignKeyToDefenseProcess < ActiveRecord::Migration[7.0]
  def change
    add_foreign_key :defense_processes, :users
  end
end

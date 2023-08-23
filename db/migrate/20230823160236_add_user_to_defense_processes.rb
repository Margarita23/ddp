class AddUserToDefenseProcesses < ActiveRecord::Migration[7.0]
  def change
    add_reference :defense_processes, :user
  end
end

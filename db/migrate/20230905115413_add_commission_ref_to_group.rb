class AddCommissionRefToGroup < ActiveRecord::Migration[7.0]
  def change
    add_reference :groups, :commission, index: true, foreign_key: true
  end
end

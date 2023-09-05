class AddCommissionRefToStudent < ActiveRecord::Migration[7.0]
  def change
    add_reference :students, :commission, index: true, foreign_key: true
  end
end

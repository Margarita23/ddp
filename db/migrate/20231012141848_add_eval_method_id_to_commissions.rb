class AddEvalMethodIdToCommissions < ActiveRecord::Migration[7.0]
  def change
    add_column :commissions, :eval_method_id, :integer
  end
end

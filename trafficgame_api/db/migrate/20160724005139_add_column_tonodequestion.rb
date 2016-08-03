class AddColumnTonodequestion < ActiveRecord::Migration[5.0]
  def change
   add_column :nodequestions, :node_id, :integer
   add_column :nodequestions, :question_id, :integer
  end
end

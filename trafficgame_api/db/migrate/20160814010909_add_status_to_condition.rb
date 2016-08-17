class AddStatusToCondition < ActiveRecord::Migration[5.0]
  def change
    add_column :conditions, :status, :int
  end
end

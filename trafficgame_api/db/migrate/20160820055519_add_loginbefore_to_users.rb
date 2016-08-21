class AddLoginbeforeToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :loginbefore, :integer
  end
end

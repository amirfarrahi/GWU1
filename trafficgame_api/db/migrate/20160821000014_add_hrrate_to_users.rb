class AddHrrateToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :hrrate, :integer
  end
end

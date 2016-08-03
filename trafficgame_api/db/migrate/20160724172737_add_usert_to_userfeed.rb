class AddUsertToUserfeed < ActiveRecord::Migration[5.0]
  def change
    add_column :userfeeds, :usert, :text
  end
end

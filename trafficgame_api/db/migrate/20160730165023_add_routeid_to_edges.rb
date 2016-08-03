class AddRouteidToEdges < ActiveRecord::Migration[5.0]
  def change
    add_column :edges, :routeid, :integer
  end
end

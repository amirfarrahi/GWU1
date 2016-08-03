class AddDistanceStartnodeEndnodeToEdges < ActiveRecord::Migration[5.0]
  def change
    add_column :edges, :distance, :float
    add_column :edges, :startnode, :integer
    add_column :edges, :endnode, :integer
  end
end

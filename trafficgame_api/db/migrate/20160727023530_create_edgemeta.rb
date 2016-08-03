class CreateEdgemeta < ActiveRecord::Migration[5.0]
  def change
    create_table :edgemeta do |t|
      t.integer :edge_id
      t.integer :mode_id
      t.integer :condition_id
      t.float :cost

      t.timestamps
    end
  end
end
